Feature:  testing different dataDriven  models

  Scenario Outline: different crendentials and roles
    *  def username = '<email>'
    *  def password = '<passwords>'
    *  def role = "<roles>"
    *  def birthDate = "<birthDate>"
    *  def Active = '<activeStatus>'
    *  def FinalInfo = "user used :"+username+", password : "+password+" logged in, whose role is "+role+" and bithdate is "+birthDate+", active status: "+Active
    *  print FinalInfo
    Examples:
      | email           | passwords | roles     | birthDate | activeStatus |
      | eli@gmail.com   | 123       | tester    | 2021-01-1 | true         |
      | alo@gmail.com   | 23456     | developer |           | false        |
      | aaaa@gmail.com  |           | QA Lead   | 2021-05-9 | true         |
      | bbbb@gmail.com  | sd234     | Designer  | 1992-03-1 | false        |
      | ccc@gmail.com   | fgt54     | manager   | 1456-01-1 | true         |
      | ddddd@gmail.com | 234ed     | HR        | 2345-01-1 | false        |


  Scenario Outline: magic variables with type hints
    * def actual = [{ name: 'elyar', age: 10 }, { name: 'ali', age: 20 }]
#     print each row one by one from the table below
    * print __row

#    print each data from given date , here from expected
    * print actual[__num]
#    * match __row == expected[__num]

    Examples:
      | name  | age! |
      | elyar | 10   |
      | Nyan  | 6    |

  Scenario Outline: embedded expressions and type hints
 #   no point of asserting the table below here but in real project we can assert the response data
    * match __row contains { name: '#(name)', alive: '#boolean' }
    * match __row == { name: '#(name)', alive: '#boolean', id:'#number' }


    Examples:
      | name | alive! |id!|
      | Bob  | false  |5 |
      | Nyan | true   |7 |


