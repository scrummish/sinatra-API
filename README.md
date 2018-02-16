## Snitchr: Crime tracking app

## What problem does it solve
Snitchr is a crime reporting app, in which civilians can report and see crimes on a map.
For civilian pedestrians: they would like to know where are the crimes happening.
For drivers stuck in traffic: where is the accident ahead of them.

## User Stories

* As a user I should be able to register for an account  

* As a user I should be able to login to my account 

* As a user I should be able to see all the posted incidents in a certain area of my   choosing _or based on IP address or gps location by default_

* As a user I should be able to post any incidents I am witnessing  

* As a user I should be able to delete any crime i posted  

* As a policeperson I should be able to post alerts for an area of my choosing or my current area. v.2

* As a policeperson I should be able to reply to citizens that have made an incident report through the app or see their contact info if they wish to share it with the police

## Wireframes

App Screens                  |  Database
:-------------------------:|:-------------------------:
![](https://github.com/scrummish/snitchr-backend/blob/master/assets/WireFrames.jpg)  |  ![](https://github.com/scrummish/snitchr-backend/blob/master/assets/Database.jpg)


## Technologies Used
* <a href="https://nodejs.org/en/">Node.js</a> - The runtime environment used to create my server.
* <a href="https://expressjs.com/">Express.js</a> - The framework used to create my server
* <a href="https://www.mongodb.com/">mongoDB</a> - The NoSQL database used to store the applications data.
* <a href="http://mongoosejs.com/">mongoosejs</a> - Serves to model my data in my database.
* <a href="https://gulpjs.com/">Gulp.js</a> - Served as my task runner for tasks like compiling my less code into css.
* <a href="http://lesscss.org/">Less.js</a> - Used as a pre proccessor to extend the capabilities of my css code.
* <a href="https://www.npmjs.com/package/bcrypt">bcrypt</a> - Used to add a layer of security to the users accounts
* <a href="http://ejs.co/">ejs</a> - Used as a templating language to create the application's pages
* <a href="https://github.com/expressjs/session">express-session</a> - Middleware/cookie used to track the users session 
* <a href="https://github.com/expressjs/body-parser">body-parser</a> - Middleware for parsing incoming request bodies 
* <a href="https://github.com/expressjs/method-override">method-override</a> - Middleware used to override HTTP Verbs
* <a href="https://en.wikipedia.org/wiki/HTML">HTML5</a> - Front end technology used to create the basic layout of each web page
* <a href="https://www.javascript.com/">javscript</a> - Programming language used for most of the apps functionality

## Requirements for install/use
App is available <a href="http://realestateleadgenerator.herokuapp.com/">HERE</a><br>
Recommended desktop browsers<br>
* google chrome
* safari
* firefox
