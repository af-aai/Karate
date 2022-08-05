Feature: Delete API Test

  Scenario: Delete
    * url  'https://reqres.in/api/users/2'
    * method   DELETE
    * status  204
    * print  responseStatus
    *  print  response