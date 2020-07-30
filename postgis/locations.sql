CREATE TABLE osgis.location
(
    id bigint NOT NULL,
    geom geometry(Point,4326),
    name character varying(80) COLLATE pg_catalog."default",
    CONSTRAINT location_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE osgis.location
    OWNER to postgres;
-- Index: sidx_location_geom

-- DROP INDEX osgis.sidx_location_geom;

CREATE INDEX sidx_location_geom
    ON osgis.location USING gist
    (geom)
    TABLESPACE pg_default;