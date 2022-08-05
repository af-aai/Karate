@ignore
Feature: Token test
  Accept-Language= de,Content-Type=application/json
  Background:
    * url  'https://nyzzuapp-api-dev.azurewebsites.net/api/v1.0/'
    * path 'Account/register'
    *  param Accept-Language = "de"
    *  param Content-Type = "application/json"
    And def requestbody =
    """
    {
  "dialCode": "+49",
  "phoneNumber": "7421234567",
  "name": "Thies",
  "aboveAgeRestriction": true
  }
  """
    * request  requestbody
    When method post
    Then status 200
    And  print  response

    Scenario:
      And match responseType == 'json'
      * def token  = response.smsToken
      * print token
      * def role  = "tester"
      * def active = true


