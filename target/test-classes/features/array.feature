Feature: various javascript tests

  Scenario: arrays returned from js can be used in match
    * def fun = function(){ return ['foo', 'bar', 'baz'] }
    * def json = ['foo', 'bar', 'baz']
#    * match json == fun()
    * print json[0]
    * set json[1] = 'elyar'
    * def last = json[json.length-1]
    * print json[1]
    * print last
  * print fun()[0]

#    * def expected = fun()
#    * match json == expected

  Scenario: arrays returned from js can be modified using 'set'

    *  def fun = function(){ return [{name : "elyar"}, {id: 2}, {b: 3}] }
    * print fun()[0]
    * def json = fun()
    * set json[1].id = 30
    * print json


  Scenario: utilities   //failed

    * def currentTime = function(){ return java.lang.System.currentTimeMillis() }
    * def a = currentTime()
    * print a

  Scenario: if codition
    * def username = 'elyar65'
    * def demoTest = username == 'elyar' ? 'user one is activated' : 'user two is activated'
    * print demoTest

  Scenario: if codition 2
    * def date = { month: 3 }
    * match date == { month: '#? _ > 0 && _ < 13' }

    * def a = 20
    * match a == '#? _>18'
    * match a == '#? _>18 && _<25'

#    belowone is gonna fail
#    * match a == '#? _>18  && _ =='#number''

    * def date = { month: 3 }
    * def min = 1
    * def max = 12
    * match date == { month: '#? _ >= min && _ <= max' }

#    And functions work as well ! You can imagine how you could evolve a nice set of utilities that validate all your domain objects.

    * def date = { month: 3 }
    * def isValidMonth = function(m) { return m >= 0 && m <= 12 }
    * match date == { month: '#? isValidMonth(_)' }


  Scenario: comparision
    * def firstUsername = 'elYAR0'
    * def secondUsername = 'elyar'

    * def comparition = function(a, b){ return a.equalsIgnoreCase(b) }
    * def ifEqual = comparition(firstUsername,secondUsername)
    * print ifEqual


  Scenario: schchema validation
    * def foo = ['bar', 'baz']

# should be an array
    * match foo == '#[]'

# should be an array of size 2
    * match foo == '#[2]'



# should be an array of strings with size 2
    * match foo == '#[2] #string'

# each array element should have a 'length' property with value 3
    * match foo == '#[]? _.length == 3'

# should be an array of strings each of length 3
    * match foo == '#[] #string? _.length == 3'

# should be null or an array of strings
    * match foo == '##[] #string'