
@negative
Feature: Reschedule the processor execution time 

Background: Define url 
    * def app_url = call read('classpath:cqubeApp/cqube_api/app_url.feature')
    * def URL = app_url.app_url
    Given url URL + '/api/spec/schedule'
    * def adapter_schedule = "0 25 11 * * ?"
    * def processing_schedule = "0 50 11 * * ?"
    * def run_code_schedule = "0 30 11 * * ?"

Scenario: Verify the Schedule API using GET method
    When method get 
    * print response
    Then match responseStatus == 404
    And match response != {}
    And match responseType == 'json'
    And match response.message == "Cannot GET /schedule"
Scenario: Verify the Schedule API without giving request body
    When method Post 
    * print response
    Then match responseStatus == 400
    And match response != {}
    And match responseType == 'json'
    And response.message[0].message == "must have required property 'processor_group_name'"


Scenario: Verify the API without providing processor_group_name property
    And request {"scheduled_at": '#(run_code_schedule)'}
    When method Post 
    * print response
    Then match responseStatus == 400
    And match response != {}
    And match responseType == 'json'
    And response.message[0].message == "must have required property 'processor_group_name'"
    
Scenario: Verify the API without providing scheduled_at property
    And request {"processor_group_name": "Run Latest Code local"}
    When method Post 
    * print response
    Then match responseStatus == 400
    And match response != {}
    And match responseType == 'json'
    And response.message[0].message == "must have required property 'scheduled_at'"

Scenario: Verify the API without providing scheduled_at property
    And request {"processor_group_name": "Run Latest Code" , "scheduled_at": '#(run_code_schedule)' }
    When method Post 
    * print response
    Then match responseStatus == 400
    And match response != {}
    And match responseType == 'json'
    And response.message[0].message == " "
