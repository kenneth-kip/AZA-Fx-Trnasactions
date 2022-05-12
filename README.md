# AZA-Fx-Trnasactions API

## About

Hi, and welcome to AZA Finance! We are just updating our FX platform and will need a new microservice
to store FX transactions. These transactions will store how much money we will receive from our
customers in the input currency, and how much we will pay them out in the output currency.

## Installation

1. Setup rails  and bundler on you machine

        $ gem install rails 6.0
        $ gem intall bundler

2. Make you have porstgres installed

        $ brew install postgresql

3. Clone this repository

4. Run `bundle install` to Install the dependecies

5. Set the environmental variables for the DB and the app
    ```
    $ export DATABASE_USERNAME=db_user
    $ export DATABASE_PASSWORD=db_password
    $ export DATABASE_NAME=aza
    ```
6. Setup up the DB by creating the database, running the migrations and seeding the data
    ```
    $ rails db:create
    $ rails db:migrate
    $ rails db:seed
    ```
7. To run the api. The app runs on port `3000`
        $ rails serve

## API Documentation

Find the [API Documenation](https://documenter.getpostman.com/view/8046984/UyxgK8mX) here.

## Contribution

Feel free to raise a PR and use this code for you own benefit

[License](https://github.com/kenneth-kip/AZA-Fx-Trnasactions/blob/main/LICENSE)
