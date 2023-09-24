@vsk-specs
Feature: Insert VSK program Schemas to spec."EventGrammar" Table.

Scenario Outline: Calling the VSK spec json file and inserting to Spec."EventGrammers" 
    * def app_url = call read('classpath:cqubeApp/cqube_api/app_url.feature')
    * def URL = app_url.app_url
    * def state_code = app_url.state_code
    * def request_data = read("classpath:cqubeApp/cqube_api/Request_Data/"+state_code+"/Schema/VSK/<file>")
    Given url URL + 'api/spec/event'
    And request request_data
    When method post
    * print response
    * if (responseStatus == 200 )  karate.call('vsk_program_specs.feature@valid')
    * if (responseStatus == 400) karate.call('vsk_program_specs.feature@invalid')
    * if (responseStatus == 500 || responseStatus == 501 || responseStatus == 502 || responseStatus == 503 || responseStatus == 504 ) karate.fail('Internal Server Error')

        Examples:
        |file|
        |diksha_etb_learning-session.json|
        |diksha_etb_plays-per-capita.json|
        |nas_all-dashboard.json|
        |nas_program-started.json|
        |pgi_all-dashboard.json|
        |pm-poshan_access-across-india.json|
        |udise-all-dashboard.json|
        |udise_program-started.json|
        |vsk_diksha_etb_coverage-status.json|
        |vsk_diksha_etb_qr-coverage.json|
        |NISHTHA_course-wise_certification.json|
        |NISHTHA_medium_of_instructions.json|
        |NISHTHA_participants_per_program.json|
        |NISHTHA_program_implementation_status.json|
        |NISHTHA_Program-wise_achieved_certificates.json|

@valid @ignore
Scenario: Check Valid Response
    * def exp_msg = 'Event grammar created successfully'
    And match response.message == exp_msg
      
@invalid @ignore
Scenario: Check Invalid Response 
    * def exist_msg = 'Program already exists'
    And match response.message == exist_msg 