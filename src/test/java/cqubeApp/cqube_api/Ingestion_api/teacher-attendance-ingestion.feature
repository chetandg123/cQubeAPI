@vsk-ingest
Feature: Ingestion of Teacher Attendance Input Files

Background: call the generate token feature file 
    * def tokenvalue = call read('classpath:cqubeApp/cqube_api/Ingestion_api/get_jwt_token.feature')
    * def token =  tokenvalue.token

Scenario Outline: Ingestion of event files 
    * def app_url = call read('classpath:cqubeApp/cqube_api/app_url.feature')
    * def URL = app_url.app_url
    * def state_code = app_url.state_code
    * def files = "../Request_Data/"+state_code+"/Input_Data/Teacher_Attendance/<file>"
    Given url URL+'api/ingestion/new_programs'
    And multipart file file = { read: '#(files)', filename: '#(file)', contentType: 'text/csv' }
    * def ingest_name = file.split('-')[0]
    * def ingest_type = 'event'
    * def exp_msg = 'File is being processed'
    And header Authorization =  'Bearer ' + token
    And multipart field ingestion_type = ingest_type
    And multipart field ingestion_name = ingest_name
    And multipart field program_name = 'school-attendance'
    When method post
    * print response
    Then status 200
    And match response.message == exp_msg
    * if (responseStatus == 200 )  karate.call('teacher-attendance-ingestion.feature@valid')
    * if (responseStatus == 400) karate.call('teacher-attendance-ingestion.feature@invalid')
    * if (responseStatus == 500 || responseStatus == 501 || responseStatus == 502 || responseStatus == 503 || responseStatus == 504 ) karate.fail('Server error')

        Examples:
        |file|
        |teachersmarked-event.data.csv|
        |teacherspresent-event.data.csv|
        |totalteachers-event.data.csv|
        
        

@valid @ignore
Scenario: Check valid response
    And match response.message == exp_msg
  
@invalid @ignore
Scenario: Check invalid response
    And match response containts exist_msg 

