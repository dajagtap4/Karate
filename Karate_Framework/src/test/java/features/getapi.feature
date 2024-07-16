Feature: GET api feature

Scenario: get user details

#Given url 'https://gorest.co.in/public/v1/users'
Given url 'https://jsonplaceholder.typicode.com/todos'
And path 1
When method Get
Then status 200
* print response
* def jsonResponse = response

* def actUserid = jsonResponse.userId
* def actid = jsonResponse.id
* def actTitle = jsonResponse.title
* def actComp = jsonResponse.completed

* print actUserid
* print jsonResponse.userId
* print actid
* print actTitle
* print actComp

* match actUserid == 1
* match actid == 1
* match actTitle == 'delectus aut autem'
* match actComp == false

Scenario: get user details - user not found 

Given url 'https://jsonplaceholder.typicode.com/todos/1'
And path '/api/data/a'
When method Get
Then status 404

