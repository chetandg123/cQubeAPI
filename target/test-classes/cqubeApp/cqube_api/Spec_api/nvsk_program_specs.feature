@nvsk-specs
Feature: Adding NVSK Spec to DB

Scenario Outline: Ingestion of event files 
    * def request_data = read("classpath:/src/test/java/cqube/Programs_SpecAPI/Grammers/NVSK/Schema/<file>")
    * print request_data 
    * def app_url = call read('classpath:/src/test/java/cqube/app_url.feature')
    * def URL = app_url.app_url
    Given url URL + 'api/spec/event'
    And request request_data
    When method post
    * print response
    * if (responseStatus == 200 )  karate.call('nvsk_program_specs.feature@valid')
    * if (responseStatus == 400) karate.call('nvsk_program_specs.feature@invalid')
    * if (responseStatus == 500 || responseStatus == 501 || responseStatus == 502 || responseStatus == 503 || responseStatus == 504 ) karate.fail('Server error')

        Examples:
        |file|
        |diksha_etb_coverage-status.json|
        |diksha_etb_etb_coverage.json|
        |diksha_etb_learning-session.json|
        |diksha_etb_plays-per-capita.json|
        |diksha_etb_program-started.json|
        |diksha_etb_qr-coverage.json|
        |diksha_quiz_program-started.json|
        |diksha_quiz-started-plan.json|
        |diksha_quiz_state-participation.json|
        # |language_wise_count.json|
        |micro-improvement_all-dashboard.json|
        |micro-improvement_district.json|
        |nas_all-dashboard.json|
        |nas_program-started.json|
        |ncf_all-dashboard.json|
        |nipunbharat_content-consumption.json|
        |nipun_bharat_entry_status.json|
        |nipunbharat_lo-covered-by-textbook.json|
        |pgi_all-dashboard.json|
        |pgi_program-started.json|
        |pgi_state-wise-performance.json|
        |pm-poshan_access-across-india.json|
        |pm-poshan_state-onboarded.json|
        # |state_wise_count.json|
        |udise-all-dashboard.json|
        |udise_program-started.json|

        |NISHTHA_course-wise_certifications.json|
        |NISHTHA_Medium_of_instruction.json|
        |NISHTHA_participants_per_program.json|
        |NISHTHA_program_implementation_status.json|
        |NISHTHA_program-wise_achieved_certification.json|

@valid @ignore
Scenario: Check valid response
    * def exp_msg = 'Event grammar created successfully'
    And match response.message == exp_msg
      
@invalid @ignore
Scenario: Check invalid response 
    * def exist_msg = 'Program already exists'
    And match response.message == exist_msg 