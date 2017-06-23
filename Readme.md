## Pré-requis :
Installer virtualbox : `sudo apt-get install virtualbox`
Installer vagrant : `sudo apt-get install vagrant`
Installer le plugin : `vagrant plugin install vagrant-triggers`

## Installer l'environnement
1. se placer dans le répertoire d'installation
2. récupérer le projet : `git clone http://github.com/osm-fr/vtile`
3. lancer la machine : `cd vtile && vagrant up`

## Lancer le serveur de tuiles vectorielles
1. se placer dans le dossier `cd /srv/utilery`
2. activer le virtualenv `workon utilery`
3. lancer le web service : `python utilery/serve.py`
4. dans un navigateur, aller sur le site : `http://localhost:3579/all/16/33186/22547.pbf`

Si tout va bien, le ficher devrait être téléchargé

## Comment bidouiller
### Comment mettre à jour les données ou changer de région
Le plus facile est de faire comme suit (depuis le chemin `/srv`) :
1. Modifier le fichier `vagrant/Vagrant_setup2_db.sh` pour indiquer le fichier GeoFabrik à utiliser
2. Executer `bash ./vagrant/Vagrant_setup2_db.sh`

La base va être supprimée, le fichier OSM sera téléchargé depuis GeoFabrik,
les données seront importées avec imposm3 et le script de retraitement des données
`./imposm_conf/osm_join_members.sql` va être executé sur la base.

### Comment ajouter un nouveau traitement de BDD dans un autre fichier sql
Créer le fichier SQL dans le répertoire `./imposm_conf` et l'ajouter à la fin du script `vagrant/Vagrant_setup2_db.sh`.

### Les répertoires clés
Les répertoires du projet :
* ./vagrant : répertoire qui contient les scripts d'installation et de nettoyage de la machine virtuelle
* ./imposm_conf : dossier contenant la configuration et les traitements d'import des données OSM en base (via ImpOSM3)
* ./apache : dossier contenant les scripts nécessaires pour monter le serveur Apache
* ./web : dossier contenant le site web qui va afficher les tuiles véctorielles (y compris le style d'affichage qui suit la spécification de Mapbox : https://www.mapbox.com/mapbox-gl-js/style-spec/)

Les répertoires qui sont créés lors de l'installation :
* ./log : contient tous les logs (installation, apache, etc.)
* ./data: dossier qui va contenir les données OSM et le cache Imposm3
* ./imposm3 et /utilery : répertoires qui contiennent les applicatifs
