@nvsk-specs
Feature: Adding Dimension Specs to DB

Scenario Outline: Adding dimension specs 
    * def request_data = read("classpath:/src/test/java/cqube/Programs_SpecAPI/Grammers/NVSK/Dimension/<file>")
    * print request_data 
    * def app_url = call read('classpath:/src/test/java/cqube/app_url.feature')
    * def URL = app_url.app_url
    Given url URL + 'api/spec/dimension'
    And request request_data
    When method post
    * print response
    * if (responseStatus == 200 )  karate.call('nvsk_dimension_specs.feature@valid')
    * if (responseStatus == 400) karate.call('nvsk_dimension_specs.feature@invalid')
    * if (responseStatus == 500 || responseStatus == 501 || responseStatus == 502 || responseStatus == 503 || responseStatus == 504 ) karate.fail('Server error')

        Examples:
        |file|
        # |academicyear-dimension.json|
        # |block-dimension.json|
        # |cluster-dimension.json|
        |district-dimension.json|
        # |exam-dimension.json|
        |grade-dimension.json|
        |medium-dimension.json|
        # |schoolcatagory-dimension.json|
        # |school-dimension.json|
        # |schoolmanagement-dimensin.json|
        # |statecatagory-dimension.json|
        |state-dimension.json|
        |subject-dimension.json|

         

@valid @ignore
Scenario: Check valid response
    * def exp_msg = 'Dimension spec created successfully'
    And match response.message == exp_msg
      
@invalid @ignore
Scenario: Check invalid response 
    * def exist_msg = 'Dimension spec already exists'
    And match response.message == exist_msg 