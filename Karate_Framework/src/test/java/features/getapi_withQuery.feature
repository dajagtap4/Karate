Feature: GET API with query parameter

Scenario:get all active users

* def query = {first_name : 'Lindsay', last_name : 'Ferguson' } 
#Given url 'https://jsonplaceholder.typicode.com/todos'
Given url  'https://reqres.in/api/users?page=2'
And params query
When method Get
Then status 200
* print response
* print query
* def jsonResponse = response
* print jsonResponse
* def jasonCount = jsonResponse.data.length
* print jasonCount
* print jsonResponse.data.id
* print jsonResponse.id
* match jasonCount == 6