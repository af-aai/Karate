Feature: Post API Test

  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
   # * def expectedOutput = read('response1.json')
  #second way for the above step
    *  def  expectedOutput =

    """
  {
  "name": "elyar",
  "job": "leader",
  "id": "#string",
  "createdAt": "#ignore"
  }
"""
 # Post with response matching from file
  Scenario: Post demo 4
    Given path '/users'
    And request { "name": "elyar", "job": "leader"}
    When method post
    Then status 201
    And  print  response
    And match response == expectedOutput
    And match $ contains {"name":"elyar"}
    And match $ == expectedOutput


  # Read body data from file
  Scenario: Post demo 5
    Given path '/users'
   # Second way :
    And def requestBody = read('classpath:data/requestBody1.json')
   # And def requestBody = read('requestBody.json')
    And request requestBody
    When method post
    Then status 201
    And match response == expectedOutput

    #To get file path relative to project
#def projectPath = java.lang.System.getProperty('user.dir')
#def projectPath = karate.properties['user.dir']
  @ignore
  Scenario:  Post demo 6
    Given path '/users'
    And   def projectPath = karate.properties['user.dir']
    And   print projectPath
    And def filePath = projectPath+"/src/test/data/RequestBody1.json"
    And print filePath
    And def requestBody1 = filePath
    And request requestBody1
    When method post
    Then status 201
    And  print response
    And match response == expectedOutput



#EXAMPLE 6
## Read body data from file and change request values
  Scenario: Post demo 7
    Given path '/users'
    And def requestBody = read('requestBody.json')
    And request requestBody
    And set requestBody.job = 'tester'
    And print requestBody
    When method post
    Then status 201
    And  print response
    And print expectedOutput
    And match response != expectedOutput
