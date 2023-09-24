@vsk-ingest
Feature: Ingestion of VSK Input Files

Background: call the generate token feature file 
    * def tokenvalue = call read('classpath:cqubeApp/cqube_api/Ingestion_api/get_jwt_token.feature')
    * def token =  tokenvalue.token

Scenario Outline: VSK Input File 
    * def app_url = call read('classpath:cqubeApp/cqube_api/app_url.feature')
    * def URL = app_url.app_url
    * def state_code = app_url.state_code
    * def files = "../Request_Data/"+state_code+"/Input_Data/VSK/<file>"
    Given url URL+'api/ingestion/national_programs'
    And multipart file file = { read: '#(files)', filename: '#(file)', contentType: 'application/zip' }
    * def exp_msg = 'File is being processed'
    And header Authorization =  'Bearer ' + token
    When method post
    * print response
    Then status 200
    And match response.message == exp_msg
    * if (responseStatus == 200 )  karate.call('Ingest_VSK_files.feature@valid')
    * if (responseStatus == 400) karate.call('Ingest_VSK_files.feature@invalid')
    * if (responseStatus == 500 || responseStatus == 501 || responseStatus == 502 || responseStatus == 503 || responseStatus == 504 ) karate.fail('Server error')

        Examples:
        |file|
        |diksha_etb_learning-session.zip|
        |diksha_etb_plays-per-capita.zip|
        |diksha_nishtha_consumption-by-course.zip|
        |diksha_nishtha_consumption-by-district.zip|
        |diksha_nishtha_percentage-enrollment-certification.zip|
        |diksha_nishtha_program-started.zip|
        |diksha_nishtha_tot-courses-medium.zip|
        |nas_all-dashboard.zip|
        |nas_program-started.zip|
        |pgi_all-dashboard.zip|
        |pm-poshan_access-across-india.zip|
        |udise-all-dashboard.zip|
        |udise_program-started.zip|
        |vsk_diksha_etb_coverage-status.zip|
        |vsk_diksha_etb_qr-coverage.zip| 
                

@valid @ignore
Scenario: Check valid response
    And match response.message == exp_msg
  
@invalid @ignore
Scenario: Check invalid response
    And match response containts exist_msg 

