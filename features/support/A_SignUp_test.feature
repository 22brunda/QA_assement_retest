@SignUp
Feature: As a end user
I should be able to SignUp to the Application
so that I should be able to Manage Application

@InVlaid_SignUp
Scenario: Trying to Create an User with InValid Credentials
Given I am on DocTalk Home Page
When I Enter InValid Credentilas in SignUp Form
Then I should see the Error Message

@ExistingUser_SignUp
Scenario: Trying to Create already ExistingUser
Given I am on DocTalk Home Page
When I try to Create an User with Existing Email Address
Then I should see Email Error Message "Email has already been taken"

