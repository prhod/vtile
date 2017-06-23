SET search_path TO import,public;
DROP TABLE IF EXISTS osm_join_members CASCADE;
CREATE TABLE osm_join_members
AS
SELECT osm_all_relation_members.name     AS            name,
       osm_all_relation_members.route    AS           route,
       osm_all_relation_members.operator AS member_operator,
       osm_all_relation_members.ref      AS      member_ref,
       osm_all_relation_members.network  AS  member_network,
       osm_all_relation_members.member   AS       member_id,
       osm_all_relation_members.geometry AS        geometry,
       osm_all_relation_members.role     AS            role,
       osm_all_relation_members.osm_id   AS     id_relation,
       osm_all_relations.tags            AS   relation_tags,
       osm_all_relations.colour          AS   relation_colour_init,
       CASE
         WHEN osm_all_relations.colour =''       THEN 'na'
         WHEN LOWER(osm_all_relations.colour) ='yellow' THEN '#ffff00'
         WHEN LOWER(osm_all_relations.colour) ='blue'   THEN '#0000ff'
         WHEN LOWER(osm_all_relations.colour) ='orange' THEN '#ffa500'
         WHEN LOWER(osm_all_relations.colour) ='brown'  THEN '#a52a2a'
         WHEN LOWER(osm_all_relations.colour) ='white'  THEN '#ffffff'
         WHEN LOWER(osm_all_relations.colour) ='green'  THEN '#008000'
         WHEN LOWER(osm_all_relations.colour) ='red'    THEN '#ff0000'
         ELSE LOWER(osm_all_relations.colour)
       END AS relation_colour
FROM   osm_all_relation_members 
INNER JOIN osm_all_relations
USING (osm_id)
WHERE  osm_all_relation_members.route != '' --AND
       --ST_GeometryType(geometry) = 'ST_LineString'
       ; 

CREATE INDEX gidx_osm_join_members ON osm_join_members UsiNG GIST(geometry);
