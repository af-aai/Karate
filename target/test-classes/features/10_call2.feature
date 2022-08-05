Feature:  call another feature
  Background:
    * def AuthFeature =  call  read('classpath:features/9_TokenAndCalling.feature')
    * def accessToken = AuthFeature.token
    * def  responsibilityRole = AuthFeature.role
    * print AuthFeature
    * print accessToken
    * print responsibilityRole

    Scenario:  First calling feature
      * print  "call success"

      # documentaqtion
  #  * header  Authorization  = 'Bearer '+accessToken



  Scenario:
#    another cool stuff to try in the future

#Feature: which makes a 'call' to another re-usable feature
#
#  Background:
#    * configure headers = read('classpath:my-headers.js')
#    * def signIn = call read('classpath:my-signin.feature') { username: 'john', password: 'secret' }
#    * def authToken = signIn.authToken
#
#  Scenario: some scenario
#  # main test steps