#### Title

* Install

```bash
sudo apt update
sudo apt install openssl
```

* Enabling Mod_SSL and Mod_Rewrite Modules.

```bash
sudo a2enmod ssl
sudo a2enmod rewrite
```

```bash
sudo systemctl restart apache2
```

* Enable .htaccess Override

```bash
sudo vim /etc/apache2/apache2.conf
```

```vim
<Directory /var/www/html>

    AllowOverride ALL

</Directory>
```

* Generate SSL Certificate

```bash
sudo mkdir /etc/apache2/certs
cd /etc/apache2/certs
```

```bash
sudo openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out apache.crt -keyout apache.key
```

