@negative
Feature: Validate the Spec API with Negative TestCases

Background: Database specs updateing scripts 
    * def app_url = call read('classpath:cqubeApp/cqube_api/app_url.feature')
    * def request_body = "../Request_Data/"+state_code+"/Schema/diksha_etb_learning-session.json"
    * def URL = app_url.app_url
    Given url URL+'/api/spec/event'

Scenario: Verify the spec api without giving request body with GET method
    When method get
    * print response
    And match responseStatus == 404
    And match response !={}
    And match responseType == 'json'
    And match response.message == "Cannot GET /event"

Scenario: Verify the spec API giving request body with GET method
    And request request_body
    When method get
    And match responseStatus == 404
    And match response !={}
    And match responseType == 'json'
    And match response.message == "must have required property 'program'"

Scenario: Verify the spec api without giving request body 
    When method post
    And match responseStatus == 400
    And match response !={}
    And match responseType == 'json'
    And match response.message == "something went wrong"

