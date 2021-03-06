Cucumber viewer
===============

Assume you have adopted [Specification by example](http://en.wikipedia.org/wiki/Specification_by_example) and [Cucumber](http://cukes.info/).

The developers usually have good tools to access features in source control and visualize them with great syntax highlightning.
But what about the product owner and other people in the organisation?
To utilize the Cucumber features as documentation they have to be accessible to everyone in an appropriate format.

My experiment
-------------

_"The simplest Cucumber feature viewer that could possibly work"_

By _simplest_ I mean...

* Get something running in notime: Initial timebox: two 40-minute train-rides...
* Easy install
* No or little maintenance - Should not require a database or index server and such...

By _could possibly work_ I mean:

* Easy access - simple webapp
* Easy to read - Syntax highlighting helps
* Immediately updated when features are (e.g. by a CI server copying feature-files to a shared disk)


Built on other's great work
---------------------------

* [Syntax highlighters for Gherkin source](http://cukes.info/gherkin-syntax-highlighters)
* [highligtht.js](http://softwaremaniacs.org/soft/highlight/en/) - Syntax highlighting "on the fly" using javascript in the browser (However I could not make it work with either their prebuilt version or their github-master repo so I used: http://cukes.info/gherkin-syntax-highlighters/highlight.js/highlight/src/highlight.js)
* [Node](http://nodejs.org/) and [Express.js](http://expressjs.com/) seemed like the easiest way to get a webserver up quick

How to use
----------

* [Install Node.js](http://nodejs.org/)
* clone this repo
* Add a config file 'products.json' (a 'product.json.example' is provided)

        {
          "products": [
            {
                "name": "Product one",
                "id": "product_1",
                "path": "/path/to/product/feature/directory",
                "description": "Bla bla bla..."
            }
          ]
        }

* Install and run

        $ npm install
        $ npm start

Done. Now serving on port 3000

Alternative environment config:

* PORT
* BASE_PATH (to be able to serve the app behind a reverse proxy and get correct urls to assets)

        $ PORT=7777 BASE_PATH='/cucumber' npm start
        => Will be serving app on http://HOST:PORT/cucumber

When feature files are changed on disk, the syntaxhighlighted webpages will too...no configuration/build step...just refresh the browser.

TODOs
-----

Because I have only put a few hours so far, there is of course much left to be done...

* Hacky code, probably not best uses of node.js/express. No tests (Yuack!)  (To be improved if I decide to continue on this...)
* Search is next thing to implement (assumption is that some node-package or Unix-grep will do...)
* Some characters in feature files makes syntax highlighting fail

License
-------
Please use/fork/enhance this if you like. Licensed under [MIT License](http://www.opensource.org/licenses/MIT).
