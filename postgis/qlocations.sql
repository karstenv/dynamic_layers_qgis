CREATE TABLE osgis.qlocation
(
    id bigint NOT NULL,
    geom geometry(Point,4326),
    name character varying(80) COLLATE pg_catalog."default",
    start date,
    stop date,
    radius integer,
    minmagnitude real,
    CONSTRAINT qlocation_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE osgis.qlocation
    OWNER to postgres;
-- Index: sidx_qlocation_geom

-- DROP INDEX osgis.sidx_qlocation_geom;

CREATE INDEX sidx_qlocation_geom
    ON osgis.qlocation USING gist
    (geom)
    TABLESPACE pg_default;