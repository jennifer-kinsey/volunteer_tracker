# Volunteer Tracker

[![Travis](https://img.shields.io/travis/rust-lang/rust.svg?style=plastic)](https://github.com/jennifer-kinsey/volunteer_tracker)

Allows an end user the ability to create, modify, and delete ongoing projects and associated volunteers with that project.
Or as I interpreted this, quests with characters.

## Screenshot

![screenshot](https://cloud.githubusercontent.com/assets/26371824/25777580/e6319c86-3295-11e7-9110-e2ce23ebeecd.png)

### Prerequisites

Web browser, terminal
Examples: Chrome, Safari

Ruby 2.3.1
Bundler

### Installing

1) Create a SQL Database for this project:
Run 'postgres' in terminal.
Run 'psql' in another tab in your terminal and then create the following databases and tables by doing the commmands below:
```
CREATE DATABASE volunteer_tracker;
\c volunteer_tracker;
CREATE TABLE projects (id serial PRIMARY KEY, project_name varchar);
CREATE TABLE volunteers (id serial PRIMARY KEY, volunteer_name varchar, project_id int);
CREATE DATABASE volunteer_tracker_test WITH TEMPLATE volunteer_tracker;
```

2) Clone this repository to your machine.

```
$ git clone https://github.com/jennifer-kinsey/volunteer_tracker.git
```

 Navigate to the file path in your terminal, and run 'app.rb' by running command:
```
$ruby app.rb
```

  If you chose to clone the repository, after you run 'app.rb' you will need to copy the localhost path into your web browser. In your Chrome, or inferior browser, go to `localhost:4567`
  
3) Start with some Zelda-themed data (optional, fun). 

While still in \c volunteer_tracker type in the following commands into your terminal:
```
INSERT INTO projects (project_name) VALUES ('Catch all the cuccoos') RETURNING id;
INSERT INTO projects (project_name) VALUES ('Learn Song of Storms on Ocarina') RETURNING id;
INSERT INTO projects (project_name) VALUES ('Catch a bunch of fairies and bottle them up') RETURNING id;
INSERT INTO projects (project_name) VALUES ('Get the Master Sword') RETURNING id;
INSERT INTO projects (project_name) VALUES ('Defeat Ganon') RETURNING id;
INSERT INTO volunteers (volunteer_name, project_id) VALUES ('Tingle', 1) RETURNING id;
INSERT INTO volunteers (volunteer_name, project_id) VALUES ('Sheik', 2) RETURNING id;
INSERT INTO volunteers (volunteer_name, project_id) VALUES ('Great Fairie', 3) RETURNING id;
INSERT INTO volunteers (volunteer_name, project_id) VALUES ('Link', 3) RETURNING id;
INSERT INTO volunteers (volunteer_name, project_id) VALUES ('Great Deku Tree', 4) RETURNING id;
INSERT INTO volunteers (volunteer_name, project_id) VALUES ('Zelda', 5) RETURNING id;
```

## Built With

* Ruby
* Sinatra
* HTML
* CSS
* Bootstrap
* Postgres

## Specifications

| behavior |  input   |  output  |
|----------|:--------:|:--------:|
|goes to homepage| User visits homepage|Can See all active volunteers, all active projects, and add a volunteer to a project|
|clicks on individual project | individual goes to the project page | individual sees the details of the project|
|clicks on modify/delete project from project page | individual goes to project modification page | user sees options to delete or modify name of project|
|user is on the project modification page | user types in different project name | user taken back to project page with updated project name|
|user is on the project modification page | user clicks button to delete the project | project is deleted|
|user clicks on the individual volunteer link | user taken to volunteer page | user can see ability to delete or modify user|
|clicks on modify/delete volunteer from volunteer page | individual goes to volunteer modification page | user sees options to delete or modify name of volunteer|
|user is on the volunteer modification page | user types in different volunteer name | user taken back to volunteer page with updated volunteer name|
|user is on the volunteer modification page | user clicks button to delete the volunteer | volunteer is deleted|
|user is on homepage and wants to add volunteer to a project|clicks on projects, types in volunteer name|volunteer is added to a specific project|

## Authors

Jennifer Kinsey

## License

Copyright © 2017 Jennifer Kinsey
