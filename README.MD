## Install and Configure Apache Web Server on Ubuntu 20.04

https://linuxhint.com/install_apache_web_server_ubuntu/

https://linuxhint.com/enable-https-apache-web-server/

https://www.tradingview.com/widget/market-quotes/

## Install

```bash
sudo apt update
sudo apt install apache2 -y
```

## Firewall configuration

```bash
sudo ufw app list
```

```bash
sudo ufw allow 'Apache'
```

```bash
sudo systemctl status apache2 
```

Press q to retrun shell prompt

## Host IP Address

Retrun host IP address
```bash
hostname -I
```

Open web page http://10.0.2.15 replace ip with hostname -I output

## Configuring Apache web server; Verifying Apache service

Create site folder and set correct permissions

```bash
sudo mkdir -p /var/www/widget.tv/html
sudo chown -R $USER:$USER /var/www/widget.tv/html
sudo chmod -R 755 /var/www/widget.tv
```

Copy `index.html` file into the site folder

```bash
sudo cp /home/jim/TV_Widget/index.html /var/www/widget.tv/html/index.html
```

```bash
sudo vi /etc/apache2/sites-available/000-default.conf
```

Insert below lines into virtual host file `000-default.conf`

```vim
<VirtualHost *:80>
ServerAdmin admin@widget.tv
ServerName widget.tv
ServerAlias widget.tv
DocumentRoot /var/www/widget.tv/html
ErrorLog ${APACHE_LOG_DIR}/error.log
CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```
Edit the `servername.conf` file

```bash
sudo vi /etc/apache2/conf-available/servername.conf
```

```vim
ServerName widget.tv
```
Run servername configuration 

```bash
sudo a2enconf servername
sudo systemctl reload apache2
```

Add Server Name to `/etc/hosts`

```bash
sudo vi /etc/hosts
```

```vim
127.0.0.1   localhost   widget.tv
```

Restart server

```bash
sudo systemctl reload apache2
```

## Apache2 Control Commands

| Command | Description |
| ------- | ----------- |
|`sudo systemctl start apache2 ` | Start Server |
|`sudo systemctl stop apache2` | Stop Server |
|`sudo systemctl reload apache2` | Update New Configurations |
|`sudo systemctl enable apache2` | Start Server On Boot |
|`sudo systemctl disable apache2` | Stop Server On Boot |

