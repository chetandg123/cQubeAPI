@vsk-specs
Feature: Insert VSK Dimension Schemas to spec."DimensionGrammer" Table.

Scenario Outline: Adding dimension specs 
    * def app_url = call read('classpath:cqubeApp/cqube_api/app_url.feature')
    * def URL = app_url.app_url
    * def state_code = app_url.state_code
    * def request_data = read("classpath:cqubeApp/cqube_api/Request_Data/"+state_code+"/Schema/Dimensions/<file>")
    * print request_data 
    Given url URL + 'api/spec/dimension'
    And request request_data
    When method post
    #* def exist_msg = "Program already exists"
    * print response
    * if (responseStatus == 200 )  karate.call('vsk_dimension_specs.feature@valid')
    * if (responseStatus == 400) karate.call('vsk_dimension_specs.feature@invalid')
    * if (responseStatus == 500 || responseStatus == 501 || responseStatus == 502 || responseStatus == 503 || responseStatus == 504 ) karate.fail('Server error')

        Examples:
        |file|
        |academicyear-dimension.json|
        |block-dimension.json|
        |cluster-dimension.json|
        |district-dimension.json|
        |exam-dimension.json|
        |grade-dimension.json|
        |medium-dimension.json|
        |school-dimension.json|
        |state-dimension.json|
        |subject-dimension.json|
        |schoolcatagory-dimension.json|
        |schoolmanagement-dimension.json|
        |statecatagory-dimension.json|

         

@valid @ignore
Scenario: Check valid response
    * def exp_msg = 'Dimension spec created successfully'
    And match response.message == exp_msg
      
@invalid @ignore
Scenario: Check invalid response 
    * def exist_msg = 'Dimension spec already exists'
    And match response.message == exist_msg 