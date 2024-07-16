Feature: POST API Demo

Background: 
* url 'https://reqres.in/api'
* header accept = 'application/json'
* def responseExpected = read("response.json")

#simple POST request
Scenario: POST demo 1
Given url 'https://reqres.in/api/users'
And request {  "name": "morpheus", "job": "leader" }
When method POST
Then status 201
And print response
* print response
And print responseStatus
And print responseTime
And print responseHeaders
And print responseCookies

#Background POST request
Scenario: POST demo 2
Given path '/users'
And request {  "name": "Deepak", "job": "QA" }
When method POST
Then status 201
And print response
* print response

#assertion POST request
Scenario: POST demo 3
Given path '/users'
And request {  "name": "Deepak", "job": "QA" }
When method POST
Then status 201
And match response == {  "createdAt": "#ignore",  "name": "Deepak", "id": "#string", "job": "QA" }
* print response

# POST ith read response from file.
Scenario: POST demo 4
Given path '/users'
And request {  "name": "Deepak", "job": "QA" }
When method POST
Then status 201
And print responseExpected
And match response == responseExpected
* print response

# POST with request.json file.
Scenario: POST demo 5
Given path '/users'
And def requestbody = read("request.json")
And request requestbody
When method POST
Then status 201
And print responseExpected
And match response == responseExpected
And match $ == responseExpected
* print response


# POST with request.json file with user.dir.
Scenario: POST demo 6
Given path '/users'
And def projectPath = karate.properties['user.dir']
And print projectPath
And def filePath = projectPath+'\src\test\java\features\request2.json'
And print projectPath
And print filePath
And def requestbody = read(filepath)
And request requestbody
When method POST
Then status 201
And print responseExpected
And match response == responseExpected





# read body data from file and chnage request value.
Scenario: POST demo 7
Given path '/users'
And def requestbody = read("request.json")
And request requestbody
And print requestbody
And set requestbody.job = 'Traveller'
And print requestbody
When method POST
Then status 201
And print responseExpected
# will not match, in response.json job is QA and we set as Traveller
And match response == responseExpected
* print response


# checking only job value that we chnaged to traveller in demo 7
Scenario: POST demo 8
Given path '/users'
And def requestbody = read("request.json")
And request requestbody
And print requestbody
And def job = requestbody.job
And print job
When method POST
Then status 201










