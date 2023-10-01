@vsk-specs
Feature: Insert the School-Attendance program schemas to spec."EventGrammer" Table.

Background: Database specs updateing scripts
    * def app_url = call read('classpath:cqubeApp/cqube_api/app_url.feature')
    * def URL = app_url.app_url
    * def state_code = app_url.state_code
    Given url URL + 'api/spec/event'
    

Scenario: Insert the Teacher Marked Spec to Database.
    * def spec_read = read("classpath:cqubeApp/cqube_api/Request_Data/VSK/"+state_code+"/Schema/Teacher-Attendance/teachersmarked.json")
    * print spec_read
    And request spec_read  
    When method post
    * print response
    * if (responseStatus == 200 )  karate.call('program_specs.feature@valid')
    * if (responseStatus == 400) karate.call('program_specs.feature@invalid')
    * if (responseStatus == 500 || responseStatus == 501 || responseStatus == 502 || responseStatus == 503 || responseStatus == 504 ) karate.fail('Internal Server Error')


Scenario: Insert the Teachers Present Spec to Database.
    * def spec_read = read("classpath:cqubeApp/cqube_api/Request_Data/VSK/"+state_code+"/Schema/Teacher-Attendance/teacherspresent.json")
    * print spec_read
    And request spec_read    
    When method post
    * print response
    * if (responseStatus == 200 )  karate.call('program_specs.feature@valid')
    * if (responseStatus == 400) karate.call('program_specs.feature@invalid')
    * if (responseStatus == 500 || responseStatus == 501 || responseStatus == 502 || responseStatus == 503 || responseStatus == 504 ) karate.fail('Internal Server Error')

Scenario: Insert the Total Teachers Spec to Database.
    * def spec_read = read("classpath:cqubeApp/cqube_api/Request_Data/VSK/"+state_code+"/Schema/Teacher-Attendance/totalteachers.json")
    * print spec_read
    And request spec_read  
    When method post
    * print response
    * if (responseStatus == 200 )  karate.call('program_specs.feature@valid')
    * if (responseStatus == 400) karate.call('program_specs.feature@invalid')
    * if (responseStatus == 500 || responseStatus == 501 || responseStatus == 502 || responseStatus == 503 || responseStatus == 504 ) karate.fail('Internal Server Error')



@valid @ignore
Scenario: Check Valid Response
    * def exp_msg = 'Event grammar created successfully'
    And match response.message == exp_msg
  
@invalid @ignore
Scenario: Check Invalid Response
    * def exist_msg = 'Program already exists'
    And match response.message == exist_msg 