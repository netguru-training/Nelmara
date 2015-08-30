Nelmara [![Build Status](https://travis-ci.org/netguru-training/nelmara.svg?branch=master)](https://travis-ci.org/netguru-training/nelmara)
================

This is a reddit-style application with improved functional.

###:star: FEATURES
* Home page
⋅⋅* Visitor can see all published content on the home pages
⋅⋅* Visitor can seach throught the posts

* Authorization and authentication
⋅⋅* User can sign up with email, google or facebook account
⋅⋅* User must be signed it in order to make changes

* User can publish content
⋅⋅* With images
⋅⋅* With hashtags
⋅⋅* Posts can be votted

* User can see the content sorted in ways:
⋅⋅* Best
⋅⋅* Newest
⋅⋅* Based on subscibed hashtags

* Comments
⋅⋅* User can comment any post
⋅⋅* Comments can be voted
⋅⋅* The best comments(most votted) are showing first

* Tags:
⋅⋅* All posts can be filtered by tags
⋅⋅* Tags can be assigned to post
⋅⋅* User can subscribe to set of tags

* User Avatars
⋅⋅* Can be added by user
⋅⋅* Can be picked randomly
⋅⋅* Can be taken from social media profile

## :dart: See Nelmara on heroku [here](https://nelmara.herokuapp.com/)
You are encouradged to create and account, but if you want to get a feel of Nelmara first, you may log in with the following email: `test@test.com` password: `adminadmin` and take a look around.

## :book: Technologies
* Ruby 2.2.2, Rails 4.2.0
* PostgreSQL, [PostgreSQL contrib packages for certain
    features](https://github.com/Casecommons/pg_search/wiki/Installing-Postgres-Contrib-Modules)
* Bootstrap
* See more on the gemfile

## :book: Setup
Copy files and provide your data:
`cp database.yml.sample database.yml`
`cp application.yml.sample application.yml`
Prepare db:
`rake db:create db:migrate db:seed`

## :bookmark: Tests
Test suite consists of: rspec, factory_girl and capybara.
Run the test suite with `rake` or `rspec spec`

## :bookmark: Notes
To generate in tmp gemsurance report about gems version on project and the newest one.
```
bundle exec gemsurance --output tmp/gemsurance_raport.html
```

