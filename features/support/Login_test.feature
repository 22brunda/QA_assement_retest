@Login
Feature: As a end user
I should be able to Login to the Application
so that I should be able to Manage Application

@InValid_Login
Scenario: Trying to Login with InValid Credentials
Given I am on DocTalk Home Page
When I Login with InValid Credentials
Then I should see Error Message as "Incorrect E-Mail or Password"
