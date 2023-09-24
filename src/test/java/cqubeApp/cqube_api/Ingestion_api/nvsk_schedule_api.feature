Feature: Schedule the Nifi Processor Groups

Background: Define Basic Inputs 
    * def app_url = call read('classpath:/src/test/java/cqubeApp/cqube_api/app_url.feature')
    * def URL = app_url.app_url
    * def storage_type = app_url.storage_type
    * def hour = app_url.hour
    * def min = app_url.min
    Given url URL
    * def time = "0 "+(min+1+" ")+(hour+"")+" * * ?"

Scenario: Reschedule the Run adapters Code Processor 
    And path '/api/spec/schedule'
    And request {"processor_group_name": "Run_adapters","scheduled_at": '#(time)'}
    When method Post 
    Then match responseStatus == 200
    And match response.message == "Successfully updated the schedule"

Scenario: Schedule the Data Moving processor 
    And path '/api/spec/schedule'
    And request {"processor_group_name": "data_moving "+ storage_type ,"scheduled_at": "0 "+(min+2+" ")+(hour+"")+" * * ?"}
    When method Post 
    Then match responseStatus == 200
    And match response.message == "Successfully updated the schedule"

Scenario: Schedule the Ingest all data processor 
    And path '/api/spec/schedule'
    And request {"processor_group_name": "ingest_all_data" ,"scheduled_at": "0 "+(min+4+" ")+(hour+"")+" * * ?"}
    When method Post 
    Then match responseStatus == 200
    And match response.message == "Successfully updated the schedule"

Scenario: Schedule Diksha Processor
    And path '/api/spec/schedule'
    And request {"processor_group_name": "diksha_"+ storage_type ,"scheduled_at": "0 "+(min+8+" ")+(hour+"")+" * * ?"}
    When method Post 
    Then match responseStatus == 200 
    And match response.message == "Successfully updated the schedule"

Scenario: Schedule Nishtha Processor
    And path '/api/spec/schedule'
    And request {"processor_group_name": "nishtha_"+ storage_type ,"scheduled_at": "0 "+(min+10+" ")+(hour+"")+" * * ?"}
    When method Post 
    Then match responseStatus == 200 
    And match response.message == "Successfully updated the schedule"

Scenario: Schedule the PGI processor 
    And path '/api/spec/schedule'
    And request {"processor_group_name": "pgi_"+ storage_type ,"scheduled_at": "0 "+(min+12+" ")+(hour+"")+" * * ?"}
    When method Post 
    Then match responseStatus == 200
    And match response.message == "Successfully updated the schedule"
Scenario: Schedule the PM Poshan Processor
    And path '/api/spec/schedule'
    And request {"processor_group_name": "pm_poshan_"+ storage_type ,"scheduled_at": "0 "+(min+8+" ")+(hour+"")+" * * ?"}
    When method Post 
    Then match responseStatus == 200 
    And match response.message == "Successfully updated the schedule"

Scenario: Schedule the NAS Processor
    And path '/api/spec/schedule'
    And request {"processor_group_name": "nas_"+ storage_type ,"scheduled_at": "0 "+(min+16+" ")+(hour+"")+" * * ?"}
    When method Post 
    Then match responseStatus == 200 
    And match response.message == "Successfully updated the schedule"

Scenario: Schedule the UDISE Processor
    And path '/api/spec/schedule'
    And request {"processor_group_name": "udise_"+ storage_type ,"scheduled_at": "0 "+(min+18+" ")+(hour+"")+" * * ?"}
    When method Post 
    Then match responseStatus == 200 
    And match response.message == "Successfully updated the schedule"

Scenario: Schedule the Micro Improvements Processor
    And path '/api/spec/schedule'
    And request {"processor_group_name": "micro_improvements_"+ storage_type ,"scheduled_at": "0 "+(min+20+" ")+(hour+"")+" * * ?"}
    When method Post 
    Then match responseStatus == 200 
    And match response.message == "Successfully updated the schedule"

Scenario: Schedule the NCF Processor
    And path '/api/spec/schedule'
    And request {"processor_group_name": "ncf_"+ storage_type ,"scheduled_at": "0 "+(min+21+" ")+(hour+"")+" * * ?"}
    When method Post 
    Then match responseStatus == 200 
    And match response.message == "Successfully updated the schedule"

Scenario: Schedule the Quiz Processor
    And path '/api/spec/schedule'
    And request {"processor_group_name": "quiz_"+ storage_type ,"scheduled_at": "0 "+(min+22+" ")+(hour+"")+" * * ?"}
    When method Post 
    Then match responseStatus == 200 
    And match response.message == "Successfully updated the schedule"

Scenario: Schedule the Nipun Bharat Processor
    And path '/api/spec/schedule'
    And request {"processor_group_name": "nipunBharat_"+ storage_type ,"scheduled_at": "0 "+(min+24+" ")+(hour+"")+" * * ?"}
    When method Post 
    Then match responseStatus == 200 
    And match response.message == "Successfully updated the schedule"