Feature: Sample API Test
  Scenario: Get API
    Given url "https://reqres.in/api/users?page=2"
    When method GET
    Then status 200
    And  print response
    And  print responseStatus
    And  print responseTime
    And  print responseHeaders
    And  print responseCookies

