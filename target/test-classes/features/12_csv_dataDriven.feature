Feature: Read csv file

  Scenario Outline:  create new user using <name> in csv file
    * url "http://dummy.restapiexample.com/api/v1"
    * path "/create"
    * def nameList = '<name>'
    * request
    """
  {
  "name":'<name>',
  "salary":'<salary>',
  "age":'<age>'
  }
  """
    *  method post
    *  status  200
    *  print   response
    *  print nameList

    Examples:
    |read('classpath:data/practice.csv')|