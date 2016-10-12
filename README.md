# Project Signup (For some thing with a name that is TBD)

## Getting Started
Rails version: 5.0
Ruby version: 2.2.4

## Running the Project

### 1. Install Postgres
I don't have the exact steps for this, so you're on your own. Good luck :)

### 2. Set up the application.yml
Create `config/application.yml` and add:
```
FB_APP_ID: xxx
FB_APP_SECRET: xxx
```
where the ID and secret correspond to a facebook app with Facebook Login.

### 3. Final steps
Then `bundle install && rake db:create && rake db:migrate`

`rails s` to start the server.
