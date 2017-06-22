#/app/imposm3/imposm3 import -read /data/download/ile-de-france-latest.osm.pbf -cachedir /data/tmp_imposm -diff -mapping /home/vtile/vecteur/mapping.yml -overwritecache
#/app/imposm3/imposm3 import -read /data/download/burkina-faso-latest.osm.pbf -cachedir /data/tmp_imposm -diff -mapping /home/vtile/vecteur/mapping.yml -appendcache
#/app/imposm3/imposm3 import -read /data/download/nicaragua-latest.osm.pbf -cachedir /data/tmp_imposm -diff -mapping /home/vtile/vecteur/mapping.yml -appendcache

/app/imposm3/imposm3 import -write -cachedir /data/tmp_imposm -diff -mapping /home/vtile/vecteur/mapping.yml -connection 'postgis://vtile@localhost/imposm' -dbschema-import import
