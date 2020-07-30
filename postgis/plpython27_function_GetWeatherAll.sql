# plpython function to get result from open weather data query back for all layers 
# the function can be used with custom data type return in the definition of the DB view 
# -> Dynamic data display in QGIS !

## IMPORTANT to make this work replace the string xyzapikey (on line 9 and line 27 in the two api calls to openweathermap) with your own key string
# to create one visit https://openweathermap.org/api
CREATE OR REPLACE FUNCTION GetWeatherAll(lon float, lat float) RETURNS weather_values AS $$
  import urllib2
  import json as json
  data = urllib2.urlopen('http://api.openweathermap.org/data/2.5/weather?lat=%s&lon=%s&appid=xyzapikey' % (lat, lon))
  js_data = json.load(data)
  if int(js_data['id'])!=0: # check if we have at least a weather station
    station = js_data
    stationname = station['name']
    stationname.encode("utf8")
    print 'Data from weather station %s' %  station['name'].encode("utf8")
    if 'main' in station:
      if 'temp' in station['main']:
        temperature = station['main']['temp'] - 273.15 # we want the temperature in Celsius
        cityid = station['id']
      else:
         temperature = -9999.9
    else:
       temperature = -9999.7
  else:
     temperature = -9999.6
  data_city = urllib2.urlopen('http://api.openweathermap.org/data/2.5/weather?id=%s&appid=xyzapikey' % (cityid))
  js_data_city = json.load(data_city)  
  city = js_data_city
  clong = city['coord']['lon']
  clat = city['coord']['lat']
  cname = city['name'].encode("utf8")
  return {"temperature": temperature, "clong": clong, "clat": clat, "cname": cname }
$$ LANGUAGE plpythonu; 
           
# create custom data type that is returned form weatehr data query to openweathermap 
CREATE TYPE weather_values AS (
  temperature float,
  clong  float,
  clat  float,
  cname   text
);                                                         
