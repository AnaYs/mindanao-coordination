# Mindanao Sector Coordination App

This is a RoR proto-type web application for coordinating the works of the German development cooperations in Mindanao, Philippines using Ruby 2.2.3, Rails 4.3.4, PostgreSQL database, the Google Maps Api, a few gems (geocoder gem for geolocation, pg_search gem for search functionality, devise gem for authentication) and bootstrap for some basic front-end. This app is currently deployed here: https://mindanao-coordination.herokuapp.com/.

You can clone the repository using the following command in your terminal:

```
$ git clone git@github.com:AnaYs/mindanao-coordination.git
```
Feel free to use pull requests to improve the current version. You may also start your complete own version of the app.


## Basic Setup

Install the gems specified in the Gemfile by running *bundle install* if you use bundler for dependencies. You could also install the gems separately using, i.e.

```
$ gem install pg
```

You will need to create a new database and run migrations locally. There is also a seedfile under db/seeds.rb which will provide for the basic information of the programs in Mindanao and a test user. For this, run the following commands:

```
$ rake db:create
$ rake db:migrate
$ rake db:seed
```
This should allow you to run a rails server with 'rails s' and inspect the web app locally.

## Comments on Modeling
The possibly confusing distinction between organisation, program and projects is necessary to account for the organisational diversity of program structure in development cooperation. An overarching program with headquarters in Manila, may have several local offices with sub-programs (here: projects) in Mindanao. For instance, COSERAM is based in Manila and Butuan and belongs to the organisation "GIZ". For some programs, the program name and organisation name may be the same, i.e. "forumZFD" is the name of the German organisation that is active internationally, but also the name of the project in Mindanao that partakes of the program "Dialogue for Peace" which has multiple offices in Mindano. Hence in this example, the organisation "forumZFD" has a program in Mindanao called "Dialogue for Peace" with multiple projects in Butuan, Davao and Cotabato with different thematic focal points but all named "forumZFD". This design may be improved, but currently seemed for me the only way to allow for flexibility of models.

Another model "activity" is envisioned that allows to pinpoint the location and themes of certain shorter term activities for possible collaboration. Such activities could then belong to projects, such as the "Movie for Peace" competition that took place in Butuan, as part of the "Peace building and development needs" projects of the "COSERAM" program. The model is already created suffice to create a controller and relevant methods to implement this functionality.

## Implemented User Stories
- I can see available programs of German development cooperation in Mindanao in a list
- I can see available programs of German development cooperation in Mindanao in a map
- I can see available projects in a list & in a map
- I can add my program and project to the database
- I can search across programs & projects
- I can find projects through their respective programs
- I can add my user profile to a program
- Only signed-in users can see program, user and project details (data protection)
- I can search for users as well
- I can search based on areas of work or expertise
- I can search based on location and/ or keywords
- I can see user profile pages, I can see my own profile page
- I can see who works for which program
- Many more, such as, I can edit my profile/program/project

## V2 User Stories
- I can depict the cover area of programs and projects
- I can see images of organisation logos and user profile pictures
- I can add individual activities to facilitate collaboration
- I can add multiple offices per program
- I can see different colors per program and project

