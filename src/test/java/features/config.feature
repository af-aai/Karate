@ignore
Feature: testing config.js file
  @test1  @ignore
  Scenario:  test1
    * print BaseUrl
    * print authInfo
    * print authInfo.token


  Scenario:  calling  the scanerio indside same feature
    * print "calling started"
    * def result = call read ('config.feature@test1')
    * print result

