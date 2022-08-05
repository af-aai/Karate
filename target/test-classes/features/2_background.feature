Feature: backgroud test

  Background:
    * url  'https://reqres.in/api'
    *  header Accept = "application/json"

  Scenario: get API 2
    Given  path '/users'
    And  param page = 2
    When method  GET
    Then status 200
    And  print response
    And  match response.data[0].first_name  != null
    And  assert  response.data.length ==6
    And  match   $.data[3].id == 10
    And match    response.data[4].last_name  == "Edwards"


  Scenario: complex json read
    * path '/users/2'
    * method  GET
    * status   200
#      * def expectedResponse = read('classpath:data/complexJsonBody.json')
    *  def expectedResponse = read('../data/complexJsonBody.json')
    * print  expectedResponse[0]
    * match   response ==  expectedResponse[0]