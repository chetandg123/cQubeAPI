@negative
Feature: Validate the Ingestion API 

Background: call the generate token feature file 
    * def tokenvalue = call read('classpath:cqubeApp/cqube_api/Ingestion_api/get_jwt_token.feature')
    * def token =  tokenvalue.token
    * def app_url = call read('classpath:cqubeApp/cqube_api/app_url.feature')
    * def URL = app_url.app_url
    * def state_code = app_url.state_code
    Given url URL+'api/ingestion/new_programs'
    * def files = "../Request_Data/VSK/"+state_code+"/Input_Data/Teacher_Attendance/teachersmarked-event.data.csv"

Scenario: Verify the ingestion api using GET Method
    And method get 
    * print response
    And match responseStatus == 404
    And match responseType == 'json'
    And match response.message == "Cannot GET /new_programs"
    And match response.error == 'Not Found'

Scenario: Verify the ingestion api without providing request data and Authorization
    And method post 
    * print response
    And match responseStatus == 403
    And match responseType == 'json'
    * print responseType
    And match response.message == 'Forbidden resource'
    And match response.error == 'Forbidden'


Scenario: Verify the ingestion api without providing ingestion name 
    And multipart file file = { read: '#(files)', filename: '#(file)', contentType: 'text/csv' }
    * def ingest_type = 'event'
    * def exp_msg = 'File is being processed'
    And header Authorization =  'Bearer ' + token
    And multipart field ingestion_type = ingest_type
    And multipart field program_name = 'school-attendance'
    When method post
    * print response
    Then match responseStatus == 400
    And match responseType == 'json'
    And match response.message[0].message == "must have required property 'ingestion_name'"

Scenario: Verify the ingestion api without providing ingestion type 
    And multipart file file = { read: '#(files)', filename: '#(file)', contentType: 'text/csv' }
    * def ingest_name = 'teachersmarked'
    * def exp_msg = 'File is being processed'
    And header Authorization =  'Bearer ' + token
    And multipart field ingestion_name = ingest_name
    And multipart field program_name = 'school-attendance'
    When method post
    * print response
    Then match responseStatus == 400
    And match responseType == 'json'
    And match response.message[0].message == "must have required property 'ingestion_type'"


Scenario: Verify the ingestion api without providing program_name 
    And multipart file file = { read: '#(files)', filename: '#(file)', contentType: 'text/csv' }
    * def ingest_name = 'teachersmarked'
    * def exp_msg = 'File is being processed'
    And header Authorization =  'Bearer ' + token
    And multipart field ingestion_type = ingest_type
    And multipart field ingestion_name = ingest_name
    And multipart field ingest_type = 'event'
    When method post
    * print response
    Then match responseStatus == 400
    And match responseType == 'json'
    And match response.message[0].message == "must have required property 'program_name'"

Scenario: Verify the ingestion api without importing csv file 
    * def ingest_name = 'school-attendance'
    * def ingest_type = 'event'
    * def exp_msg = 'File is being processed'
    And header Authorization =  'Bearer ' + token
    And multipart field ingestion_type = ingest_type
    And multipart field ingestion_name = ingest_name
    And multipart field program_name = 'school-attendance'
    When method post
    * print response
    Then match responseStatus == 400
    And match responseType == 'json'
    And match response.message == "File is required"
