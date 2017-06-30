import requests, csv
from lxml import html

# wikipage = requests.get("https://fr.wikipedia.org/wiki/Liste_de_fruits_comestibles")
# html_tree = html.fromstring(wikipage.content)
#
# fruits = html_tree.xpath("//*[@class='colonnes']/ul/li/a[1]/text()")
# print (fruits)

wikipage = requests.get("https://fr.wikipedia.org/wiki/Liste_des_animaux_d%27%C3%A9levage")
html_tree = html.fromstring(wikipage.content)

animaux = html_tree.xpath("//ul/li/ul/li/a[1]/text()")
print (animaux)
