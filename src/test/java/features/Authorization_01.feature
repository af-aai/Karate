Feature:  API Authentication

  Scenario:  form field
    * url 'https://reqres.in/api'
    * path 'register'
    * form field email = 'eve.holt@reqres.in'
    * form field password = 'pistol'
    * method post
    * status 200
    * print response


  Scenario: form fields
    * url 'https://reqres.in/api'
    * path 'register'
    * def params =
    """
    {
    "email": "eve.holt@reqres.in",
    "password": "pistol"
}

    """
    * form fields params
#    * form field grat_type = 'sfsf'   we can also do this
    * method post
    * status 200
    * print response

  Scenario: regular post
    * url 'https://reqres.in/api'
    * path 'register'
    * def requestBody =
    """
    {
    "email": "eve.holt@reqres.in",
    "password": "pistol"
}

    """
    * request requestBody
    * method post
    * status 200
    * print response