## plpython functions (python v 2.7)

# Prerequisites to enable plpython functions in Postgresql / PostGIS and to use the LATERAL join

* Postgresql version 9.3+ (introduces LATERAL join type)
* PostGIS extension installed
* Python 2.7 installed
* plpython language enabled in the database (plpython2 or plpythonu will work out of the box with the examples provided)

**Create a PostGIS Database with the name 'osgis'** (open source gis) to use the files here (almost) without any edits out of the box (exception see note for Example1 - step 3 below).
Run the SQL files in this folder to create the Database views and plpython functions inside the database **osgis** (_owned by **postgres** db user_)

## There are files for two examples in this diretory:

### 1. Combining PostGIS Database Views and dynamic queries with API calls the Openweather map API 

To make this example run correctly

1. load the sql for the point file osgis.location first (run locations.sql). This will create an empty table structure for the point locations you will later manually add in QGIS

2. create the function GetWeatherAll (run plpython27_function_GetWeatherAll.sql )

**IMPORTANT to make step 3 work before running the SQL do replace the string xyzapikey (on line 9 and line 27 in db_view_nearest_weatherstation.sql the two api calls to openweathermap) with your own key string** - to create one visit [Weather API](https://openweathermap.org/api)

3. Create the db view (run db_view_nearest_weatherstation.sql )

4. Add the table and view to your QGIS project

5. Add (digitize - this will work for worldwide locations) a location point and save

6. Refresh the map display - the dynamic data in the view should now be visible


### 2. Combining PostGIS Database Views and dynamic queries with API calls the USGS Earthquake API

To make this example run correctly

1. load the sql for the point file osgis.qlocation first (run qlocations.sql). This will create an empty table structure for the point locations you will later manually add in QGIS

2. create the function (run plpython27_function_GetEarthquakeAll.sql)

3. Create the db two db views (run db_view_earthquakes_in_radius.sql and db_view_qqloc_earthquake_line.sql ). To verify if the function and API call is running correctly try this SQL query in the database: 

```sql
select getearthquakeall('2020-01-01'::date ,'2020-03-01'::date, -120::real, 40::real,200, 1.7)
```
The result should look the same as [this HTTP request](https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=2020-01-01&endtime=2020-03-01&latitude=40&longitude=-120&maxradiuskm=200&minmagnitude=1.7&orderby=magnitude) (gets 40 earthquake events back as JSON) to the same API (try in a browser):

```html
https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=2020-01-01&endtime=2020-03-01&latitude=40&longitude=-120&maxradiuskm=200&minmagnitude=1.7&orderby=magnitude
```

4. Add the table and view to your QGIS project

5. Add (digitize - this will work for locations inside the boundaries of the USandA only ) a location point and save

6. Refresh the map display - the dynamic data in the two db view should now be visible




