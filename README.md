# Clock Logger

Code exercise to be reviewed by HiMama team. This app contains a simple
authentication method (using devise) to allow the teacher to sign up, sign 
in and register his clock in/out events.

* Instructions to use the app

  - Follow this link: https://clock-logger.herokuapp.com
  - The app is deployed on a free heroku instance, so please give it a minute
  to wake up.
  - Click the Sign Up button.  Provide an email and a password.  Any email
  will work (even a fake one since I'm not asking for confirmation).
  - Once logged in, you will see the main page.  You can click on the 
  Clock In button to register your first event.
  - The app knows about your last (current) clock event.  If your current event
  is a Clock Out, you will only be able to Clock In and vice versa.
  - Events will appear at the right side of the main page.  From there, you can
  edit or delete an event.
  - When you are done.  You can click in Sign out to leave the app.  If you
  sign in again, you will see your last state.
   
* What was used

  To build this app I used:
  
  - Ruby 2.5.3
  - Rails 6.0.0
  - Postgresql (any recent version will work)

  And from Rails:
  
  - Devise (for authentication)
  - Minitest
  - SimpleCov for coverage
  - Twitter Bootstrap (didn't want to render just plain pages).  It was installed
  via yarn as explained here:

https://medium.com/@guilhermepejon/how-to-install-bootstrap-4-3-in-a-rails-6-app-using-webpack-9eae7a6e2832

* If you want to run this locally

  - Clone this repo
  - Be sure to be on a rails 6 ruby compliant version
  - bundle install
  - Install yarn
  - Run migrations (adjust to desired database if don't want to use postgresql)
  - To run server:  rails server
  - To run tests: rails test

* How did you approach this challenge?

I read the challenge description, took some time to figure out
the development strategy, and the tools I was going to use. Then
I start writing a small prototype and when I was sure it has the
all the features required, I build on it things like authentication,
bootstrap template, etc.

Finally, I wrote the full set of tests reaching a 90%+ coverage on
the code I wrote.

* What schema design did you choose and why?

Given the time restrictions, I decided to build a traditional monolitic
rails 6 app to deliver a fully functional demo in less than 48 hours.
I gave up using any modern Javascript framework (React, Angular) in favor
of building a full functional app with a full test suite.

* If you were given another day to work on this, how would you spend it? What if you were
  given a month?

If an extra day were given:

  - I would write more feature tests, probably using Capybara.
  - A role system: It's weird that the same teacher is able to edit/delete
  his logs. I would probably use a gem like rolify to allow the system to
  have 2 roles.  The teacher and the administrator. The later will be the
  only one allowed to edit/delete a log.
  - More UI validations.
  
If an extra month were given:

  - Rebuild the app to reach an API strategy. Basically rails for the
  backend and a front end app build in a modern Javascript framework
  (React, Angular or Vue).
  - Master/slave strategy using new rails 6 core functionalities.  