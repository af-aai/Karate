Feature:some notes

# print space even if there is no space between is and elyar
  Scenario: print more
    When  print 'my name is','elyar'
    Then  print "my name is","elyar"
    And  print  4+8,"equlas 12"
    And  def   role =  "tester"
    And  def   name = "elyar"
    Then print  "my role is",role+",name is"+name
    And  def  json = { "name": "elyar", "job": "leader"}
    *    print   json


#    the last step : output : my role is tester,name iselyar ,  as we see , represents add one space
  @ignore
  Scenario: print json
    *  def student =
    """
    {
    "firstName":"elyar",
    "lastName":"King",
    "salary": 1000,
    "role": "teacher",
    "active": true,
    "data":[
    {
    "gender":"male",
    "id":234,
    "company":"appsfactory"
    },{
     "gender":"male",
    "id":345,
    "company":"intel"
    },{
     "gender":"male",
    "id":486,
    "test":"",
    "company":"amazon"
    }]
    }
    """
    *  print student.role
    *  print student.data[0].id
    *  print student.data[1].id
    *  print student.data[2].company
    *  match student.data[2].id == 486
    *  def  length = student.data.length
    *  print length
#    varify it is string or number or if present
    *  match student.firstName == "#string"
    *  match student.data[0].id == "#number"
    *  match student.manager  == "#notpresent"
    *  match student.active ==  "#boolean"
    *  match student.data[2].test == "#notnull"
    *  def  studentLength = student.length
    *  def  studentLength = "#null"
    *  match student.data[2].test == "#ignore"


#     extra stuff from documentation

    * match foo == '#string'
# convenient (and recommended) way to check for array length
    * match bar == '#[2]'

#    Remove If Null
    * def data = { a: 'hello', b: null, c: null }
    * def json = { foo: '#(data.a)', bar: '#(data.b)', baz: '##(data.c)' }
    * match json == { foo: 'hello', bar: null }

#     if statement


  #null:      #Expects actual value to be null, and the data element or JSON key must be presen
  # ignore :       #Skip comparison for this field even if the data element or JSON key is present

    #------------------------------------------------Assertion

    *  match  student  contains  {"firstName":"elyar","role":"teacher"}
    *  match  student  contains  {"data":[{"gender":"male","id":234,"company":"appsfactory"},{"gender":"male","id":345,"company":"intel"},{"gender":"male","id":486,"test":"","company":"amazon"}]}
    *  match  student  !contains  {"data":[{"gender":"male","id":234,"company":"appsfactory"},{"gender":"male","id":345,"company":"intel"},{"gender":"male","id":486,"test":""}]}
    *  match    each student.data[*].gender == "male"
    *  match    each  student.data  contains  {"gender":"male"}

    # error part
    *  def   gender =  each student.data[*].gender
    *  print  gender




