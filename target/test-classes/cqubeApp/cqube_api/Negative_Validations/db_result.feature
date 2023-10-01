Feature: Calling Python Script

Background:
#  * def db_connector_script = 'src/test/java/cqubeApp/cqube_api/Negative_Validations/db_connector.py'
  * def db_connector_script = karate.properties['user.dir'] +'/src/test/java/cqubeApp/cqube_api/Negative_Validations/db_connector.py'


Scenario: Call Python Script with Query
  * def query = "SELECT count(*) FROM employee;"
  * def result = karate.exec('python3 ' + db_connector_script + ' "' + query + '"')
  * print 'Python Script Result:', result
  * def totalRecords = result.trim() 
  * def totalRecordsInt = totalRecords == null ? 0 : parseInt(totalRecords)
  * print 'total records: ' + totalRecordsInt
  # * match totalRecordsInt == 10

# Scenario: Call Python Script with Query
#     * def query = "SELECT count(*) FROM spec."EventGrammer";"
#     * def result = karate.exec('python3 ' + db_connector_script + ' "' + query + '"')
#     * print 'Python Script Result:', result
#     * def totalRecords = result.trim() 
#     * def totalRecordsInt = totalRecords == null ? 0 : parseInt(totalRecords)
#     * match totalRecordsInt == 10

#   Scenario: Call Python Script with Query
#     * def query = "SELECT count(*) FROM spec."DimensionGrammar";"
#     * def result = karate.exec('python3 ' + db_connector_script + ' "' + query + '"')
#     * print 'Python Script Result:', result
#     * def totalRecords = result.trim() 
#     * def totalRecordsInt = totalRecords == null ? 0 : parseInt(totalRecords)
#     * match totalRecordsInt == 10




