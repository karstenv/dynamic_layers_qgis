CREATE OR REPLACE VIEW osgis.earthquakes_in_radius AS 
 SELECT row_number() OVER () AS gid,
    st_x(st_transform(w.geom, 4326)) AS loc_x,
    st_y(st_transform(w.geom, 4326)) AS loc_y,
    round(st_distance(st_transform(w.geom, 3857), st_transform(st_setsrid(st_makepoint(f.qlong, f.qlat), 4326), 3857))::numeric, 0) AS dist_m,
    f.magnitude,
    f.qlong,
    f.qlat,
    st_setsrid(st_makepoint(f.qlong, f.qlat), 4326) AS geom,
    f.place,
    w.id as qlocation_id
   FROM osgis.qlocation w,
    LATERAL getearthquakeall(w.start, w.stop, st_x(st_transform(w.geom, 4326)), st_y(st_transform(w.geom, 4326)), w.radius, w.minmagnitude::double precision) f(place, magnitude, qlong, qlat);

ALTER TABLE osgis.earthquakes_in_radius
  OWNER TO postgres;