DATABASES = {
    "default": "dbname=bus_vectoriel user=python host=datasrv.canaltp.local"
}
RECIPES = ['/srv/utilery_conf/utilery.yml']
TILEJSON = {
    "tilejson": "2.1.0",
    "name": "utilery",
    "description": "A lite vector tile server",
    "scheme": "xyz",
    "format": "pbf",
    "tiles": [
        "http://localhost:3579/all/{z}/{x}/{y}.pbf"
    ],
}
BUILTIN_PLUGINS = ['utilery.plugins.builtins.CORS']
PLUGINS = []
DEBUG = True
SRID = 900913
SCALE = 1
BUFFER = 0
CLIP = False
CORS = "*"
