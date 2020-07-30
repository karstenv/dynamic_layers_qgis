## plpython functions (python v 2.7)

# Prerequisites to enable plpython functions in Postgresql / PostGIS and to use the LATERAL join

* Postgresql version 9.3+ (introduces LATERAL join type)
* PostGIS extension installed
* Python 2.7 installed
* plpython language enabled in the database (plpython2 or plpythonu will work out of the box with the examples provided)

Create a PostGIS Database with the name 'osgis' (open source gis) to use the files here without any edits out of the box.
Run the SQL files in this folder to create the Database views and plpython functions inside the database **osgis** (_owned by **postgres** db user_)

There are two examples in this diretory:

### 1. Combining PostGIS Database Views and dynamic queries with API calls the Openweather map API 

To make this example run correctly

1. load the sql for the point file osgis.location first (run location.sql). This will create an empty table structure for the point locations you will later manually add in QGIS

2. create the function GetWeatherAll (run plpython27_function_GetWeatherAll.sql )

3. Create the db view (run db_view_nearest_weatherstation.sql )

4. Add the table and view to your QGIS project

5. Add (digitize - this will work for worldwide locations) a location point and save

6. Refresh the map display - the dynamic data in the view should now be visible


### 2. Combining PostGIS Database Views and dynamic queries with API calls the USGS Earthquake API

To make this example run correctly

1. load the sql for the point file osgis.qlocation first (run qlocation.sql). This will create an empty table structure for the point locations you will later manually add in QGIS

2. create the function (run plpython27_function_GetEarthquakeAll.sql)

3. Create the db two db views (run db_view_earthquakes_in_radius.sql and db_view_qqloc_earthquake_line.sql )

4. Add the table and view to your QGIS project

5. Add (digitize - this will work fpr locatiosn in the US and A only ) a location point and save

6. Refresh the map display - the dynamic data in the two db view should now be visible




