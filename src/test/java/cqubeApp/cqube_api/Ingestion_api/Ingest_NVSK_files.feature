@nvsk-ingest
Feature: Ingestion of VSK Input Files

Background: call the generate token feature file 
    * def tokenvalue = call read('classpath:cqubeApp/cqube_api/Ingestion_api/get_jwt_token.feature')
    * def token =  tokenvalue.token

Scenario Outline: upload image
    * def app_url = call read('classpath:cqubeApp/cqube_api/app_url.feature')
    * def URL = app_url.app_url
    * def state_code = app_url.state_code
    * def files = "../Request_Data/NVSK/Input_files/<file>"
    Given url URL+'api/ingestion/national_programs'
    And multipart file file = { read: '#(files)', filename: '#(file)', contentType: 'application/zip' }
    * def exp_msg = 'File is being processed'
    And header Authorization =  'Bearer ' + token
    When method post
    * print response
    Then status 200
    And match response.message == exp_msg
    * if (responseStatus == 200 )  karate.call('Ingest_NVSK_files.feature@valid')
    * if (responseStatus == 400) karate.call('Ingest_NVSK_files.feature@invalid')
    * if (responseStatus == 500 || responseStatus == 501 || responseStatus == 502 || responseStatus == 503 || responseStatus == 504 ) karate.fail('Internal Server Error')

        Examples:
        |file|
        |diksha_etb_coverage-status.zip|
        |diksha_etb_etb-coverage.zip|
        |diksha_etb_learning-session.zip|
        |diksha_etb_plays-per-capita.zip|
        |diksha_etb_program-started.zip|
        |diksha_etb_qr-coverage.zip|
        |diksha_quiz_program-started.zip|
        |diksha_quiz-started-plan.zip|
        |diksha_quiz_state-participation.zip|
        |micro-improvement_all-dashboard.zip|
        |micro-improvement_district.zip|
        |nas_all-dashboard.zip|
        |nas_program-started.zip|
        |ncf_all-dashboard.zip|
        |nipunbharat_content-consumption.zip|
        |nipun_bharat_entry_status.zip|
        |nipunbharat_lo-covered-by-textbook.zip|
        |pgi_all-dashboard.zip|
        |pgi_program-started.zip|
        |pgi_state-wise-performance.zip|
        |pm-poshan_access-across-india.zip|
        |pm-poshan_state-onboarded.zip|
        |udise-all-dashboard.zip|
        |udise_program-started.zip|
        |NISHTHA_course-wise_certifications.zip|
        |NISHTHA_Medium_of_instruction.zip|
        |NISHTHA_participants_per_program.zip|
        |NISHTHA_program_implementation_status.zip|
        |NISHTHA_program-wise_achieved_certification.zip|   


@valid @ignore
Scenario: Check Valid Response
    And match response.message == exp_msg
  
@invalid @ignore
Scenario: Check Invalid Response
    And match response containts exist_msg 

