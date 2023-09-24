Feature:

Background:
#   * def tokenvalue = call read('classpath:src/test/java/cqubeApp/cqube_api/Ingestion_api/get_jwt_token.feature')
#   * def token =  tokenvalue.token
  * url 'http://localhost:9001'
  * configure headers = { 'Authorization': 'Bearer minioadmin:minioadmin' }

Scenario: Verify files are uploaded to the "cqube-minio-bucket" bucket
  Given path '/api/v1/buckets/cqube-minio-bucket/objects'
  When method GET
  Then status 200
  * def responseObjects = response
  * print responseObjects
  #* def expectedFiles = ['file1.txt', 'file2.jpg', 'file3.pdf']  // Replace with the expected file names
  #* match responseObjects contains only expectedFiles
