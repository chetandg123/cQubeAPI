
# Feature: Fetch PostgreSQL Table Count

# Background:
# * def config = { db: { url: 'jdbc:postgresql://localhost:5432/postgres', driverClassName: 'org.postgresql.Driver', username: 'postgres', password: 'cQube@123' } }

# Scenario:
#   Given driver config
#   And def query = 'SELECT COUNT(*) FROM emplyee'
#   And def result = karate.query(config, query)
#   And def rowCount = result[0][0]
#   Then print 'Row count:', rowCount
#   And match rowCount > 0

Feature: Fetch PostgreSQL Table Count

Background:
* def config = { db: { url: 'jdbc:postgresql://localhost:5432/postgres', driverClassName: 'org.postgresql.Driver', username: 'postgres', password: 'cQube@123' } }

Scenario:
  Given driver config
  And def query = 'SELECT COUNT(*) FROM employee'  // Corrected table name
  * def result = karate.query(config, query)
  And def rowCount = result[0][0]
  Then print 'Row count:', rowCount
  And match rowCount > 0
