# README

Learning rails and briefly list few usefull commands.

# Rails commands

### Gen new controller

    $ docker-compose run --rm learning-rails bash -c "bin/rails g controller Greeting"

### Gen new model

    $ docker-compose run --rm learning-rails bash -c "bin/rails g model Greeting"
    $ docker-compose run --rm learning-rails bash -c "bin/rails g model Greeting title:string content:text"

A `foreign_key` on `_id` with the keyword `references`:

    $ docker-compose run --rm learning-rails bash -c "bin/rails g model Greeting title:string content:text project:references"

### Gen new scaffold

    $ docker-compose run --rm learning-rails bash -c "bin/rails g scaffold contacts"
    $ docker-compose run --rm learning-rails bash -c "bin/rails g scaffold contacts title:string content:text"

### Create table

    $ docker-compose run --rm learning-rails bash -c "bin/rails db:migrate"

### Delete scaffold

    $ docker-compose run --rm learning-rails bash -c "bin/rails destroy scaffold contacts"
    
### Test validation with rails server

    $ docker-compose run --rm learning-rails bash -c "bin/rails c"
    > Project.create!(name: "Learning Rails")
    > quit

### Clearing tables on rails server

    $ docker-compose run --rm learning-rails bash -c "bin/rails c"
    > Project.delete_all

# Postgres commands

### Connect to psql

    $ psql -h localhost -p 5432 -d webapp_development -U webapp --password

### List databases

    \list

### List tables

    \dt

### Drop tables

    DROP TABLE contacts;

### DATABASE TEST, PROD
Theses databases have to be create:

    $ docker-compose run --rm learning-rails bash -c "RAILS_ENV=test bin/rails db:create"
    $ docker-compose run --rm learning-rails bash -c "RAILS_ENV=production bin/rails db:create"

Or manually into psql:

    > CREATE DATABASE webapp_test;
    
### Rspec
Run all test with:

    $ docker-compose run --rm learning-rails bash -c "bin/bundle exec rspec"

Run a specific test with:

    $ docker-compose run --rm learning-rails bash -c "bin/bundle exec rspec bacon/spec/bacon_spec.rb" 

