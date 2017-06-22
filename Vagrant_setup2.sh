LOG_FILE=/srv/log/setup.log
mkdir /srv/data/
cd /srv/data/
wget http://download.geofabrik.de/europe/france/ile-de-france-latest.osm.pbf


sudo -u postgres bash -c "dropdb --if-exists utilery;"  >> $LOG_FILE
sudo -u postgres bash -c "createdb -E UTF8 -T template0 -O ubuntu utilery;"  >> $LOG_FILE
sudo -u postgres psql -c "CREATE extension hstore; CREATE extension postgis;" utilery >> $LOG_FILE

cd /srv/
#./imposm3/imposm3 import -cachedir /srv/data/tmp_imposm -connection postgis://ubuntu:-ubuntu-@localhost/utilery -mapping mapping.yml -read ./data/ile-de-france-latest.osm.pbf -write -overwritecache
./imposm3/imposm3 import -connection postgis://ubuntu:-ubuntu-@localhost/utilery -mapping mapping.yml -read ./data/ile-de-france-latest.osm.pbf -write -overwritecache
