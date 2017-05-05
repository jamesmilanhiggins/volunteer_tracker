# Volunteer Tracker

This program lets someone add projects and assign volunteers to a specific project

### Prerequisites

Web browser with ES6 compatibility
Examples: Chrome, Safari

Ruby
Bundler

### Installing
* run postrgres in your terminal
* run psql in your terminal
* Create a database with the command "CREATE DATABASE volunteer_tracker;"
* connect into that database with "\c volunteer_tracker"
* add the table "CREATE TABLE projects (id serial PRIMARY KEY, project_name varchar);"
* add the second table "CREATE TABLE volunteers (id serial PRIMARY KEY, volunteer_name varchar, project_id int);"
* create a template database with "CREATE DATABASE volunteer_tracker_test WITH TEMPLATE volunteer_tracker;"

* run "ruby app.rb" and open local host to navigate to the site



## Built With

* Ruby
* Sinatra
* HTML
* CSS
* Bootstrap https://getbootstrap.com/
* ES6
* Jquery https://jquery.com/

## Specifications

| behavior |  input   |  output  |
|----------|:--------:|:--------:|
<!--SPECS GO HERE-->

## Authors

* James Higgins

## License

MIT Copyright © 2017 James Higgins
