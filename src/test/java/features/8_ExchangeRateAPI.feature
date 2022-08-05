`Feature:API EXTRA



  Scenario: header assertion
    Given  url "https://api.exchangerate.host"
    *      path  "/latest"
    *      method get
    And    status  200
    And  print response
    And  print responseStatus
    And  print responseTime
    And  print responseHeaders
    And  print responseCookies

    *    match  header   Content-Type  == "application/json; charset=utf-8"
    #why ....
    *    match  header   Content-Encoding  == "#null"
    *    match  header   Server  == "cloudflare"
    *    match  header   Transfer-Encoding == "chunked"
    *    print  response.rates.ALL
#
#    Scenario:  query param
#      Given  url  "dsff"
#      *      path  "lkcmsdlk"
#      *      param  firstQueryParamKey = "value"
#      *      param  secondQueryParamKey = "value"
#      *      method  Get
#      Then  status   200
#      *     match header  Content-Type  == "application/json; charset=utf-8"
#
#



