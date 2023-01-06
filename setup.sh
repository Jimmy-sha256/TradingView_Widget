#!/bin/bash

# update and install server
sudo apt update
sudo apt install apache2 -y

# firewall configuration
sudo ufw allow 'Apache'

# create site folder and set correct permissions
sudo mkdir -p /var/www/widget.tv/html
sudo chown -R $USER:$USER /var/www/widget.tv/html
sudo chmod -R 755 /var/www/widget.tv

# copy index.html into site folder
sudo cp /home/jim/TradingView_Widget/index.html /var/www/widget.tv/html/index.html

# create virtual host conf file
sudo touch /etc/apache2/sites-available/000-default.conf

echo "<VirtualHost *:80>
ServerAdmin admin@widget.tv
ServerName widget.tv
ServerAlias widget.tv
DocumentRoot /var/www/widget.tv/html
ErrorLog ${APACHE_LOG_DIR}/error.log
CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>" | sudo tee /etc/apache2/sites-available/000-default.conf

# create servername.conf file
sudo touch /etc/apache2/conf-available/servername.conf

echo "ServerName widget.tv" | sudo tee /etc/apache2/conf-available/servername.conf

sudo a2enconf servername
sudo systemctl reload apache2

# add server name to /etc/hosts
sudo sed -i '1s/^/127.0.0.1   localhost   widget.tv\n/' /etc/hosts

# restart server
sudo systemctl reload apache2

# launch server on boot
sudo systemctl enable apache2
