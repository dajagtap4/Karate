Feature: Get API Demo

Background: 
* url 'https://reqres.in/api'
* header accept = 'application/json'

#simple get request
Scenario: Get demo 1
Given url 'https://reqres.in/api/users?page=2'
When method GET
Then status 200
And print response
* print response
And print responseStatus
And print responseTime
And print responseHeaders
And print responseCookies

#Get with background
Scenario: Get demo 2 
Given path '/users?page=2'
When method GET
Then status 200
And print response

#Get with path param
Scenario: Get demo 3 
#https://reqres.in/api/users?page=2
Given path '/users'
And param page = 2
When method GET
Then status 200
And print response

#Get with background
Scenario: Get demo 4 
Given path '/users?page=2'
When method GET
Then status 200
And print response

And match response.data[2].last_name != null
And assert response.data[3].first_name == 'Byron'
And match $.data[5].email == 'rachel.howell@reqres.in'
And assert response.data[3].id == 10
#And assert $.data[3].id == 10  $ not used with assert 

And print response.data[2].last_name
And print response.data[3].first_name
#And print $.data[3].first_name  //Not work $ with print
And print response.data[5].email
And print response.data[3].id


