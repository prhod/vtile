LOG_FILE=/srv/log/setup.log

echo 'installation de Apache'
sudo apt install apache2 -y
sudo apt-get install libapache2-mod-wsgi -y

sudo cp /srv/apache/apache_conf /etc/apache2/sites-available/utilery.conf
sudo a2dissite 000-default.conf
sudo a2ensite utilery.conf
sudo service apache2 reload
