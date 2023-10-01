
Feature: Define QA Server - URL

# Provide the state_name for which state data to be tested i.e AP or JH
# mvn test -Dkarate.options="--tags @vsk-ingest"
# mvn test -Dkarate.options="--tags @vsk-specs"
    

Feature: Defining the API url and State_Code
# mvn test -Dkarate.options="--tags @vsk-specs"
# mvn test -Dkarate.options="--tags @vsk-ingest"
    
Scenario: Define the URL 
    * def app_url = "<url>"
    * def state_code = 'JH'
    * def storage_type = ''
    * def min = 15
    * def hour = 15

   