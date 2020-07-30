# plpython function to get result from USGS earthquake API data query back for all records 
# the function can be used with custom data type return in the definition of the DB view
# https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=2020-01-21&endtime=2020-07-24&latitude=45&longitude=-125&maxradiuskm=100&minmagnitude=2.5&orderby=magnitude  
# -> Dynamic data display in QGIS !
CREATE OR REPLACE FUNCTION GetEarthquakeAll(start date ,stop date, lon float, lat float,radius int, minmagnitude float) RETURNS SETOF equake_values AS $$
  import urllib2
  import json as json
  data = urllib2.urlopen('https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=%s&endtime=%s&latitude=%s&longitude=%s&maxradiuskm=%s&minmagnitude=%s&orderby=magnitude' % (start,stop,lat,lon,radius,minmagnitude))
  js_data = json.load(data)
  equake = js_data
  equakearray = []
  a = 0
  for i in equake['features']:
    equakeplace = i['properties']['place'] # tile for earthquake location
    magnitude =   i['properties']['mag']
    qlong =       i['geometry']['coordinates'][0]
    qlat =        i['geometry']['coordinates'][1]      
    equakevalue = {"place": equakeplace, "magnitude": magnitude , "qlong": qlong, "qlat": qlat}
    equakearray.append(equakevalue)
    a = a+1
  return equakearray
$$ LANGUAGE plpythonu; 
           
# create custom data type that is returned from equake  data API query
CREATE TYPE equake_values AS ( 
  place text,
  magnitude float,
  qlong  float,
  qlat  float
);                                                         