## plpython functions (python v 2.7)

# Prerequisites to enable plpython functions in Postgresql / PostGIS and to use the LATERAL join

* Postgresql version 9.3+ (introduces LATERAL join type)
* PostGIS extension installed
* Python 2.7 installed
* plpython language enabled in the database (plpython2 or plpythonu will work out of the box with the examples provided)

Create a PostGIS Database with the name 'osgis' (open source gis) to use the files here without any edits out of the box.
Run the SQL files in this folder to create the Database views and plpython functions inside the database **osgis** (_owned by **postgres** db user_)
