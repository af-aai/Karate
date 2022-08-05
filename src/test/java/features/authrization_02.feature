
Feature: basic parameter test
  @ignore
  Scenario: form fields
    * url 'https://reqres.in/api'
    * path 'register'
    * def params =
"""
    {
    "email": "#(email)",
    "password": "#(password)"
}

    """
    * form fields params
#    * form field grat_type = 'sfsf'   we can also do this
    * method post
    * status 200
    * print response
    * def access_Token = response.token
    * print  access_Token



  Scenario: get API 2
    * url  'https://reqres.in/api'
    *  header Accept = "application/json"
    Given  path '/users'
    And  param page = 2
    When method  GET
    Then status 200
    And  print response
    And  match response.data[0].first_name  != null
    And  assert  response.data.length ==6
    And  match   $.data[3].id == 10
    And match    response.data[4].last_name  == "Edwards"
    *  def  result = response
    *  path '/users/'+(result.data[0].id-5)
    * method  GET
    * status   200
    * match response.data contains {"id":'#((result.data[0].id-5))'}