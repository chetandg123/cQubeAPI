
Feature: Generate jwt token 

Background: Token for ingestion
    * def app_url = call read('classpath:cqubeApp/cqube_api/app_url.feature')
    * def URL = app_url.app_url
    Given url URL
Scenario: karate script to get token
    And path 'api/ingestion/generatejwt'
    When method Get
    Then status 200 
    * def token = response
