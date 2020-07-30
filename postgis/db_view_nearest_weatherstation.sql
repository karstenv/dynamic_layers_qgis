CREATE OR REPLACE VIEW osgis.nearest_weatherstation
 AS
 SELECT st_x(st_transform(w.geom, 4326)) AS loc_x,
    st_y(st_transform(w.geom, 4326)) AS loc_y,
    round(st_distance(st_transform(w.geom, 3857), st_transform(st_setsrid(st_makepoint(f.clong, f.clat), 4326), 3857))::numeric, 0) AS dist_m,
    f.temperature,
    f.clong,
    f.clat,
    st_setsrid(st_makepoint(f.clong, f.clat), 4326) AS geom,
    f.cname
   FROM osgis.location w,
    LATERAL getweatherall(st_x(st_transform(w.geom, 4326)), st_y(st_transform(w.geom, 4326))) f(temperature, clong, clat, cname);

ALTER TABLE osgis.nearest_weatherstation
    OWNER TO postgres;