Feature: GET api headers feature

Scenario: pass user request with headers

Given url 'https://reqres.in/api/users?page=2'
And path 1
When method Get
Then status 200
* print response