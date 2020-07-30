CREATE OR REPLACE VIEW osgis.qloc_earthquake_line AS 
 SELECT row_number() OVER () AS gid,
    st_makeline(st_setsrid(eq.geom, 4326), st_setsrid(ql.geom, 4326)) AS geom,
    round(st_distance(st_transform(eq.geom, 3857), st_transform(ql.geom, 3857))::numeric / 1000::numeric, 1) AS dist_km,
    eq.place, eq.qlocation_id
   FROM osgis.earthquakes_in_radius eq,
    osgis.qlocation ql where ql.id = eq.qlocation_id;

ALTER TABLE osgis.qloc_earthquake_line
  OWNER TO postgres;