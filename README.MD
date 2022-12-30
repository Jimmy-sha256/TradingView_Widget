#### Install and Configure Apache Web Server on Ubuntu 20.04

https://linuxhint.com/install_apache_web_server_ubuntu/

https://linuxhint.com/enable-https-apache-web-server/


---

* Install

```bash
sudo apt update
sudo apt install apache2 -y
```

* Firewall configuration

```bash
sudo ufw app list
```

```bash
sudo ufw allow 'Apache'
```

```bash
sudo systemctl status apache2 | cat
```

```bash
hostname -I
```

Open web page http://10.0.2.15 replace ip with hostname -I output


* Configuring Apache web server; Verifying Apache service

```bash
sudo mkdir -p /var/www/my_site.com/html
sudo chown -R $USER:$USER /var/www/my_site.com/html
sudo chmod -R 755 /var/www/my_site.com
```

```bash
sudo cp /home/jim/TV_Widget/index.html /var/www/my_site.com/html/index.html
```

```bash
sudo vi /etc/apache2/sites-available/000-default.conf
```

```vim
<VirtualHost *:80>
ServerAdmin admin@my_site.com
ServerName my_site.com
ServerAlias my_site.com
DocumentRoot /var/www/my_site.com/html
ErrorLog ${APACHE_LOG_DIR}/error.log
CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```


```bash
sudo apache2ctl configtest
```

```bash
sudo vi /etc/apache2/conf-available/servername.conf
```

```vim
ServerName my_site.com
```

```bash
sudo a2enconf servername
sudo systemctl reload apache2
sudo apache2ctl configtest
```

```bash
sudo vi /etc/hosts
```

```vim
127.0.0.1   localhost   my_site.com
```
