#!/bin/bash

sudo apt -y update
sudo apt install -y apache2
sudo ufw allow 'Apache'

# install prometheus
sudo apt-get install -y prometheus

#créer le site web static

cd /var/www/html/
sudo mv index.html indexold.html

echo "<!DOCTYPE html>
<html>
<head>
    <title>Une petite page HTML</title>
    <meta charset="utf-8" />
</head>
<body>
<h1>ON-X Cloud Hybride (AWS + On Premise)</h1>
<p> Ceci est une page de test.</p>
<h2>Serveur 1</h2>
</body>
</html>" > index.html

sudo /etc/init.d/apache2 restart