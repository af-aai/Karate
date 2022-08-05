Feature:  call with parameter

  Scenario Outline: calling
#    *  def myCalling = call read('../features/authrization_02.feature'){"email": "<email>","password": "<password>"}
    * def data = {"email": "<email>","password": "<password>"}
    * def myCalling = call read('/authrization_02.feature') data
    *  def access_token = myCalling.access_Token
    * url 'https://reqres.in/api/users?page=2'
#    * header Authorization = 'Bearer ' + accessToken
    * print myCalling.params
    * print data

    * print access_token
    * method Get
    * status 200
    Examples:
      | email              | password |
      | eve.holt@reqres.in | pistol   |
      | elyar              | abdullah |
      | hello              | ok       |





