# Volunteer Tracker

####This program lets someone add projects and assign volunteers to a specific project, May 5th, 2017

#### By James Higgins

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
|As a non-profit employee, I want to add new projects|Add: House Remodel|Projects: house remodel|
|As a non-profit employee, I want to view projects|View|Projects: House Remodel|
|As a non-profit employee, I want to update projects|update House remodel to Apartment Remodel|Projects: Apartment Remodel |
|As a non-profit employee, I want to delete projects|delete Apartment Remodel|Projects:|
|As a non-profit employee, I want to add new volunteers to projects|Add: James|Project 1 - Volunteer James|
|As a non-profit employee, I want to view volunteers to projects|View: Project 1|Project 1 - Volunteer James|
|As a non-profit employee, I want to add update volunteers of projects|Update: Mike|Project 1 - Volunteer Mike|
|As a non-profit employee, I want to delete volunteers from projects|Delete: Mike|Project 1 - Volunteer []|

## Known Bugs
Right now the method to update a volunteer is working, but the front end is not working.

the delete method for volunteer currently does not work

## Support and Contact details
Please email james.milan.higgins@gmail.com with any questions.
## Authors

* James Higgins

## License

MIT Copyright © 2017 James Higgins
