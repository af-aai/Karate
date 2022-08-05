Feature:  test faker java class

  Scenario: create random phonenumber
    * def javaClassLinker = Java.type('utilities.dataGenerator')
    * def phoneNumber = javaClassLinker.randomPhoneNumber()
    * print phoneNumber


  Scenario Outline: nuzyapp randome <phoneNum>
    * url "https://nyzzuapp-api-dev.azurewebsites.net/api/v1.0/Account/register"
    *  request
      """
      {
    "dialCode": "+49",
    "phoneNumber":'<phoneNum>',
    "name": "Thies",
    "aboveAgeRestriction": true
}
      """
    * method post
    * status 200
    * print response.smsToken
    Examples:
      | phoneNum   |
      | 7421234569 |
      | 7421234563 |
      | 7421234587 |

  Scenario: nuzyapp randome phoneNum
    * url "https://nyzzuapp-api-dev.azurewebsites.net/api/v1.0/Account/register"
    * def javaClassLinker = Java.type('utilities.dataGenerator')
    * def phoneNumber = javaClassLinker.randomPhoneNumber()
    *  def requestBody =
      """
      {
    "dialCode": "+49",
    "phoneNumber":'',
    "name": "Thies",
    "aboveAgeRestriction": true
}
      """
    *  set requestBody.phoneNumber = phoneNumber
    *  print requestBody
    * request requestBody
    * method post
    * status 200



  Scenario: nuzyapp using randome data to generate token
    *  url "https://nyzzuapp-api-dev.azurewebsites.net/api/v1.0/Account/register"
    *  def javaClassLinker = Java.type('utilities.dataGenerator')
    *  def requestBody = javaClassLinker.createRequestBodyWithRandomPhoneNumber()
    *  print requestBody
    *  request requestBody
    *  method post
    *  status 200
    *  print response.smsToken
