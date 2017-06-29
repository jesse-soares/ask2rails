# Ask2Rails

Simple question and answer platform. Project for Ruby on Rails training.

### Ruby on Rails versions

* Ruby 2.4.1

* Rails 5.1.2

### System dependencies

* Postgresql

* Nodejs

## Configuration

...

### Database

Create the database:

        $ rake db:create:all

Apply the database migrations:

        $ rake db:migrate

Apply migrations into test database:

        $ rake db:test:prepare

Open the configured database:

        $ rails db

### Test suite:

* RSpec

* Capybara

### Deployment instructions

...

### Reference links

* Getting Started with Rails [(http://guides.rubyonrails.org/getting_started.html)](http://guides.rubyonrails.org/getting_started.html)
* Ruby on Rails Guides [(http://guides.rubyonrails.org)](http://guides.rubyonrails.org)
* The API Documentation [(http://api.rubyonrails.org)](http://api.rubyonrails.org)
* Ruby on Rails Tutorial [(https://www.railstutorial.org/book)](https://www.railstutorial.org/book)

### Steps used to generate the project

1. Install Ruby:

    * newest version: https://www.ruby-lang.org/pt/downloads/

    * ruby version managers:
      * rvm [(http://rvm.io/)](http://rvm.io/)
      * rbenv - recommended

    * using rvm:

        $ rvm install 2.4.1

        $ rvm use 2.4.1 --default

2. Install Rails:

        $ gem install rails

3. Install Bundler (dependencies manager)
  
        $ gem install bundler

4. Create the project

        $ rails new ask2rails -d postgresql -T -J

      where:

        -d : database (mysql, postgresql, sqlite3, oracle...)

        -T : skip test unit

        -J : skip javascript files (validations, etc)

5. Configure and create database

6. Configure Rspec

        $rails g rspec:install
