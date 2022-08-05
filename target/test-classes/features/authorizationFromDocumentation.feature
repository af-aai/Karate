@ignore
Feature:Documentation

  Background:
    * url 'https://gmail.googleapis.com/gmail/v1/users/'

  @ignore
  Scenario: oauth 2 flow

#* path 'token'
#* form field grant_type = 'password'
#* form field client_id = 'demoapp'
#* form field client_secret = 'demopass'
#* form field username = 'demouser'
#* form field password = 'testpass'
#* method post
#* status 200
#
#* def accessToken = response.access_token
#    ------------------------------------
    * def accessToken = 'ya29.A0ARrdaM9Utz3dN8qezT8Z39adu6Z-seWuwQYIoZuDx8dfFjLAHNO4RWINCXJrq8KXAIvqcVj4Kp-7aZhG5P84oW_ruttXMjIAwyPYDYoxuAtApfwu_AjdaiisymugPvF8oA6d54Esh6Hte06YQ2r90uNX2FTa'
    * path 'glamourregressiontest@gmail.com/messages'
    * header Authorization = 'Bearer ' + accessToken
# * param access_token = accessToken
    * method get
    * status 200
    * def lastEmailId = response.messages[0].id
    * print lastEmailId
    * path  'glamourregressiontest@gmail.com/messages/'
    * path  lastEmailId
    * header Authorization = 'Bearer ' + accessToken
    * method get
    * status 200
    * def emailContent = response.snippet
    * print emailContent