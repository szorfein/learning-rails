# README

Learning rails and briefly list few usefull commands.

# Rails commands

### Gen new controller

    $ docker-compose run --rm learning-rails bash -c "bin/rails g controller Greeting"

### Gen new scaffold

    $ docker-compose run --rm learning-rails bash -c "bin/rails g scaffold contacts"
    $ docker-compose run --rm learning-rails bash -c "bin/rails g scaffold contacts title:string content:text"

### Create table

    $ docker-compose run --rm learning-rails bash -c "bin/rails db:migrate"

### Delete scaffold

    $ docker-compose run --rm learning-rails bash -c "bin/rails destroy scaffold contacts"
    
# Postgres commands

### Connect to psql

    $ psql -h localhost -p 5432 -d webapp_development -U webapp --password

### List databases

    \list

### List tables

    \dt

### Drop tables

    DROP TABLE contacts;
