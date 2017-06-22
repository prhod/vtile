## Pré-requis :
Installer virtualbox : `sudo apt-get install virtualbox`
Installer vagrant : `sudo apt-get install vagrant`
Installer le plugin : `vagrant plugin install vagrant-triggers`

## Installer l'environnement
1. se placer dans le répertoire d'installation
2. récupérer le projet : `git clone http://github.com/osm-fr/vtile`
3. lancer la machine : `cd vtile && vagrant up`

## Lancer le site
1. se placer dans le dossier `cd /srv/utilery`
2. activer le virtualenv `workon utilery`
3. lancer le web service : `python utilery/serve.py`
4. dans un navigateur, aller sur le site : `http://localhost:3579/all/16/33186/22547.pbf`

Si tout va bien, le ficher devrait être téléchargé

===============================================
1. Chargement d'une base Postgres-Postgis :

Je vous conseille de vous charger une base en local chez vous. Une petite zone que vous connaissez pour pouvoir jouer avec les données dans PgAdmin et dans Qgis. C'est assez utile quand on ne comprend pas ce qui ne marche pas dans la figuration des tuiles vectorielles.

Pour charger les données on utilise Imposm3 :
https://github.com/omniscale/imposm3

Imposm3 attend un fichier de conf (mapping.yml en copie). Ce fichier de conf décrit l'organisation des tables et leur contenu que l'on souhaite pour la base de données source.
Par exemple la table poi est de type ponctuel, elle a pour champ ; osm_id, name, tags, key et class. Key contient la clé du tag et class la valeur. on aura par exemple pour un bar ; 'amenity' dans key et 'bar' dans class.

Les données, imposm3 les pioche dans un .pbf. Pour une petite zone, les pbf de geofabrik sont parfaits.
J'ai mis les commandes exemples en copie.


1'. Traitements de données :

Un premier traitement permet de récupérer les couleurs des lignes de bus des route_master : sm_join_members.
Le second est ma tentative des routes parallèles. Il est assez moche et est une concaténation d'idées trouvées en ligne :)
Si ça peut servir de point de départ, tant mieux, mais je pense que si vous avez d'autres idées c'est presque aussi simple de ne pas s'occuper de ces bouts de script (lignes.sql).

Je ne l'ai pas vérifié. Le modèle de données à peut-être changé (mapping.yml) donc attention aux noms des tables et champs.

2. Générer les tuiles vectorielles :

On utilise Utilery.
De la petite expérience que j'ai des serveurs de tuiles les fichiers de conf on parfois un langage un peu différent mais leur organisation est très similaire et repose de toute façon sur l'interrogation directe d'une base de données.
Ce fichier décrit l'organisation des tuiles qui sont elles même des petites BD (sqlite même). Il y a donc une organisation par tables. Un point important concerne les minzoom et les maxzoom. Je ne m'en suis pas occupée mais il fuadra. C'est un des paramètres qui nous permettra de réduire le poids des tuiles qu'on envoie au client.

3. Partie client :

Le fichier de conf permet au client de représenter les données géométriques stockées dans les tuiles qu'il a téléchargé.
C'est le fichier le plus facile à prendre en main je pense.
Il dépend directement du fichier utilery.yml puisque chaque paragraphe de règle graphique s'adresse à une des tables contenues dans les tuiles vectorielles.
Il faut prendre un moment pour se familiariser avec toutes les possibilités et les règles. Le débuggueur dans le navigateur est souvent assez efficace pour identifier un oubli de virgule ou une règle écrite à la mauvaise place dans un paragraphe.

https://www.mapbox.com/mapbox-gl-js/style-spec/

web : http://vtile.openstreetmap.fr/jb/
