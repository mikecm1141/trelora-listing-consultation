[![Build Status](https://travis-ci.org/mikecm1141/trelora-listing-consultation.svg?branch=master)](https://travis-ci.org/mikecm1141/trelora-listing-consultation)
[![Reviewed by Hound](https://img.shields.io/badge/Reviewed_by-Hound-8E64B0.svg)](https://houndci.com)
![ruby 2.4.4](https://img.shields.io/badge/ruby-2.4.4-red.svg)
![rails_ 5.2](https://img.shields.io/badge/rails_-5.2-blue.svg)


# README
### ABOUT TRELORA
TRELORA is a Denver flat-fee real estate brokerage that uses cutting-edge technology and a team-based approach to Real Estate that gives its clients 24/y access to their transaction and full-service experts to get that transaction across the finish line.

### ABOUT THE APPLICATION
After a Listing client has self-scheduled or has had a Pricing Appointment scheduled for them, a Home Agent goes to the client's home. There are multiple reasons for this visit:
- Capture additional information not currently in public records,
- Advise clients on maximizing the value of their home,
- Light home staging, and
- Take a retainer payment

This application is a Listing Consultation Tool, to be used as a Mobile Web Application. It consists of browser based web pages linked together and accessed by either a smart phone or a tablet. This application is able to scale to any sized device - from desktop down to tablet and handheld smartphones. It interfaces with a set of 3 TRELORA webservices:
- POST – To Authenticate the Home Agent and generate the Authorization token for use with all other webservices,
- GET – To pull Transaction details relevant to the Listing Consultation, and
- POST – To create a record of the data collected by the Home Agent in the Listing Consultation

### Functionality
#### User Login:
Login/Authentication Screen. 

Tabs: Find tab is highlighted. Prepare and Collect grayed out and not accessible.
Fields:
 - Member Email: varchar(255); Employee Member accounts are unique to an email addressValidation; Ensure the field is not nil; Client Error Message: Member Email Invalid.
 - Password: varchar(255) – Please use an input type of "password"; Validation – Ensure the field is not nil.Client Error Message – Password Invalid.
 - Login – Clicking this button should perform the following:
    - Data validation on Member Email and Password Fields. 
    - With the Login credentials:
      - Call TRELORA Login Webservice, 
      - Parse HTTP Response Status Code:
        - If successful – 200 OK – Get HTTP_AUTH_TOKEN from response. 
        - If invalid attempt – 401 UnauthorizedClient Error Message – Display Under Member Email “Invalid Login”

#### Pricing Location Address Screen. 
Here, a user enters the address of the Listing Consultation.

Tabs: Find tab is highlighted. Prepare and Collect grayed out and not accessible. 
Fields:
  - Pricing Location Address: varchar(255); Address of listing consultation; Validation: Ensure the field is not nil.
  - Find Location: Clicking this button should perform the following:
    - Call TRELORA Transaction Retrieval Webservice, 
    - Parse HTTP Response Status Code:
     - If successful: 200 OK – JSON response will contain requested data - If Address not found: 404 Not FoundClient Error Message – Display Under Pricing Location Address “Address Not Found”
     - If HTTP_AUTH_TOKEN not present or invalid – 401 Unauthorized

#### Pricing Location Preparation Screen. 
Here, a user reviews all necessary information for the  Listing Consultation before going to the Collect tab to begin the consultation. During the consultation, the Member User can return to this page at any time by selecting the Prepare

- Tabs: Prepare tab is highlighted. Collect tab is grayed out and not accessible. 
- Clicking the Find tab will take a user back to Address Lookup. 
- Data fields will be enumerated in Find Location webservice (API). 
- The Email field should be a link that opens the device's email client to send an email to this client. 
- The Phone field should be a link that opens the device's phone client to call this client. 
- The Map field should open Google Maps for this location. 
- The Zillow field should open Zillow for this location.

#### Home Consulation:
This is the screen that the Home Advisor will use to gather the client's information during the Listing Consultation. To get to this screen, you must click the Collect tab.

- Tabs: Collect tab is highlighted. All tabs accessible. 
- Clicking the Find tab will take the Member User back to Address Lookup. - Clicking the Prepare will take the Member User back to Pricing Location Preparation Screen with all the data still populated. 
- We want to gather the Home Advisor's time per consultation, so until the consultation has started display a panel over the form fields on the page. 
- When the Startbutton is clicked, two things happen, an internal timer starts, and the panel over the form fields is removed making the form editable.
- When the Finish button is clicked, three things should happen:
  - Data should be validated:
    - Buyer agent commission should be a varchar. (IE, 2.8% or $3000, etc)- Recommended List Price should be an integer between 1 and 100000000
    - Credit Card Number should be a valid credit card number
    - All other fields should not be nil.
  - Internal Timer should be stopped
  - Data should be posted to trelora web service (including the internal timing). The names of the fields for this page will be included in the API delivery. After the data is uploaded, Create an overlay that displays the completion time and has a Dismiss button. If the Dismiss button is clicked, remove the overlay so the user can see screen again with all its data still populated, though no longer able to modify the data. Remove the Finish button as well.


### Technical Specifications:

Ruby version
- This application is built on Ruby 2.4.4 and Rails 5.2

Deployment instructions
 - Clone a copy of this repository.
 - Run `bundle` from the command line
 - Application is hosted on AWS at: http://production.maxq5hwib2.us-west-2.elasticbeanstalk.com

System Dependencies
- rails: https://guides.rubyonrails.org/
- pg: https://www.postgresql.org/
- puma: https://github.com/puma/puma
- sass-rails: https://github.com/rails/sass-rails
- uglifier: https://github.com/lautis/uglifier
- webpacker: https://github.com/rails/webpacker
- mini_racer for ruby:https://github.com/discourse/mini_racer
- coffee-rails: https://github.com/rails/coffee-rails
- turbolinks: https://github.com/turbolinks/turbolinks
- jbuilder: https://github.com/rails/jbuilder
- bootsnap: https://github.com/Shopify/bootsnap
- faraday: https://github.com/lostisland/faraday
- figaro: https://github.com/laserlemon/figaro
- bootstrap: https://getbootstrap.com/
- jquery-rails: https://github.com/rails/jquery-rails

Test Suite
- pry: https://github.com/pry/pry
- capybara: https://github.com/teamcapybara/capybara
- launchy: https://github.com/copiousfreetime/launchy
- rspec-rails: https://github.com/rspec/rspec-rails
- awesome_print: https://github.com/awesome-print/awesome_print
- shoulda-matchers: https://github.com/thoughtbot/shoulda-matchers
- database_cleaner: https://github.com/DatabaseCleaner/database_cleaner
- factory_bot_rails: https://github.com/thoughtbot/factory_bot_rails
- simplecov: https://github.com/colszowka/simplecov
- webmock: https://github.com/bblimke/webmock
- vcr: https://github.com/vcr/vcr

Database creation
- Data is stored on a local Postgres database

How to run the test suite
- Test suite built on RSpec. 
- Run 'rspec' from the command line to run the full test suite
