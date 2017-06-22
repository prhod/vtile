LOG_FILE=/srv/log/setup.log
mkdir -p /srv/log/

sudo sh -c "echo 'export LC_ALL=\"fr_FR.UTF-8\"' >> ~/.bashrc"  >> $LOG_FILE
source ~/.bashrc
sudo locale-gen "en_US.UTF-8"
sudo locale-gen "fr_FR.UTF-8"

sudo apt-get -q update >> $LOG_FILE
sudo apt-get install postgresql-9.5 postgresql-contrib-9.5 postgresql-9.5-postgis-2.2 postgresql-client-common -y  >> $LOG_FILE

echo "localhost:5432:*:ubuntu:-ubuntu-" >> ~/.pgpass
sudo chmod 600 ~/.pgpass
sudo -u postgres psql -c "CREATE USER ubuntu WITH PASSWORD '-ubuntu-';"  >> $LOG_FILE

echo 'installation de Imposm3'
mkdir /srv/imposm3/
cd /srv/imposm3/
wget https://imposm.org/static/rel/imposm3-0.4.0dev-20170519-3f00374-linux-x86-64.tar.gz
tar -xvzf imposm3-0.4.0dev-20170519-3f00374-linux-x86-64.tar.gz
mv imposm3-0.4.0dev-20170519-3f00374-linux-x86-64/* .
rm imposm3-0.4.0dev-20170519-3f00374-linux-x86-64.tar.gz
rm -r imposm3-0.4.0dev-20170519-3f00374-linux-x86-64

echo 'installation des pré-requis Utilery'
cd /srv/
sudo apt install python3.5 python3.5-dev python-pip python-virtualenv git -y  >> $LOG_FILE
sudo apt install python3-pip -y
sudo apt install postgresql-server-dev-9.5 -y
pip3 install --upgrade pip
sudo pip3 install virtualenvwrapper
sudo rm /usr/bin/python
sudo ln -s /usr/bin/python3 /usr/bin/python
sudo sh -c "echo 'source \"/usr/local/bin/virtualenvwrapper.sh\"' >> ~/.bashrc"  >> $LOG_FILE
sudo sh -c "echo 'export WORKON_HOME=~/Envs' >> ~/.bashrc"
sudo sh -c "echo 'export UTILERY_SETTINGS=/srv/utilery_conf.py' >> ~/.bashrc"
source "~/.bashrc"
mkdir -p $WORKON_HOME

mkvirtualenv utilery --python=/usr/bin/python3
git clone https://github.com/tilery/utilery
cd /srv/utilery
pip3 install .
pip3 install -r requirements.txt


# echo 'installation de Apache'
# sudo apt install apache2
# sudo apt-get install libapache2-mod-wsgi
#
# sudo cp /srv/apache/apache_conf /etc/apache2/sites-available/utilery.conf
# sudo a2dissite 000-default.conf
# sudo a2ensite utilery.conf
# sudo service apache2 reload
