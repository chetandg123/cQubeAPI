@nvsk-nvsk
Feature: Validate the Dimension API with positive and negative Scenarios 

Background: Defining the App domain and API end point 
    * def tokenvalue = call read('classpath:cqubeApp/cqube_api/Ingestion_api/get_jwt_token.feature')
    * def token =  tokenvalue.token
    * def app_url = call read('classpath:cqubeApp/cqube_api/app_url.feature')
    * def URL = app_url.app_url
    Given url URL+'api/new_programs'

Scenario Outline: Uploading the dimension files to buckets 
    * def files = "../Request_Data/NVSK/Dimension/<file>"
    * print files
    * def app_url = call read('classpath:cqubeApp/cqube_api/app_url.feature')
    * def URL = app_url.app_url
    Given url URL+ 'api/ingestion/new_programs'
    And multipart file file = { read: '#(files)', filename: '#(file)', contentType: 'text/csv' }
    * def ingest_name = file.split('-')[0]
    * def ingest_type = 'dimension'
    * def exp_msg = 'File is being processed'
    * print ingest_name
    And header Authorization =  'Bearer ' + token
    And multipart field ingestion_type = ingest_type
    And multipart field ingestion_name = ingest_name
    When method post
    * print response
    Then status 200
    And match response.message == exp_msg
    * if (responseStatus == 200 )  karate.call('ingest_nvsk_dimensions.feature@valid')
    * if (responseStatus == 400) karate.call('ingest_nvsk_dimensions.feature@invalid')
    * if (responseStatus == 500 || responseStatus == 501 || responseStatus == 502 || responseStatus == 503 || responseStatus == 504 ) karate.fail('Server error')

        Examples:
        |file|
        |district-dimension.data.csv|
        |grade-dimension.data.csv|
        |medium-dimension.data.csv|
        |state-dimension.data.csv|
        |subject-dimension.data.csv|

Scenario: Verify the ingestion api using GET Method
    And method get 
    And header Authorization =  'Bearer ' + token
    * print response
    And match responseStatus == 404
    And match responseType == 'json'
    And match response.message == "Cannot GET /dimensions"
    And match response.error == 'Not Found'

Scenario: Verify the ingestion api without importing dimension file
    And method post
    And header Authorization =  'Bearer ' + token
    * print response
    And match responseStatus == 403
    And match responseType == 'json'
    * print responseType
    And match response.message == 'Forbidden resource'
    And match response.error == 'Forbidden'

Scenario: Verify the ingestion api without giving token Authorization
    * def files = "../Request_Data/Dimensions/district-dimension.data.csv"
    And multipart file file = { read: '#(files)', filename: 'district-dimension.data.csv', contentType: 'application/csv' }
    And method post
    * print response
    And match responseStatus == 403
    And match responseType == 'json'
    * print responseType
    And match response.message == 'Forbidden resource'
    And match response.error == 'Forbidden'


@valid @ignore
Scenario: Check valid response
    And match response.message == exp_msg
  
@invalid @ignore
Scenario: Check invalid response
    And match response containts exist_msg 