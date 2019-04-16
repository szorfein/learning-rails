# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
## Docker
Example of docker command with rail: 

    $ docker-compose run --rm webapp bash -c "bin/rails <command>"

## Generate a new controller

    $ bin/rails g controller Greeting 

## Rebuild after update

    $ docker-compose up --build
