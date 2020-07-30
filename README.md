# Presentation slides and collection of examples for dynamic layers in QGIS 
for a talk at [QGIS North America 2020](http://qgis.us/qgis-na-2020.html) - July 31st
by Karsten Vennemann, Terra GIS LTD

The combination of QGIS with spatial data bases such as Spatialite, Geopackage and PostGIS allows for creating dynamic GIS layers. A simple example for this is adding to QGIS a layer based on a database view in PostGIS (or Spatialite). Such database views can include any of the geospatial functions available in the database via their data definition (SQL) query. Adding to the complexity and flexibility of this usage such a database view can not only include references to multiple layers and include geospatial functions (such as buffers or geometry intersects) but can also include joins to custom functions allowing for very flexible use cases. In the talk I will give a short overview about the general concept and show multiple live examples of dynamic content of layers based on (the editing of) a regular database layer.

## Links

* **QGIS Geometry Generator**

  * [Video - Basic look at the QGIS Geometry Generator style](https://www.youtube.com/watch?v=0YxjJ-9zIJ0)

  * [Insightful slides / talk](https://polemic.nz/2019/11/18/foss4g-qgis-geometry-generators/)

  * [QGIS Docs](https://docs.qgis.org/3.10/en/docs/user_manual/style_library/symbol_selector.html?highlight=generator#the-geometry-generator)

* [**Spatialite**](https://plpygis.readthedocs.io/en/latest/plpython.html#type-mappings)

* [**PostGIS and plpython**](https://plpygis.readthedocs.io/en/latest/plpython.html#type-mappings)

