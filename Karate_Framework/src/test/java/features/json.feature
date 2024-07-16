Feature: json feature testing 

Scenario: json reader parser

* def jsonArray =

"""
[
{
	"name" : "deepak",
	"age" : 30,
	"city" : "Pune"
},
{
	"name" : "sumeet",
	"age" : 31,
	"city" : "washim"
}
]
"""

* print jsonArray
* print jsonArray[0].name
* print jsonArray[1].name + "" + jsonArray[1].age + "" + jsonArray[1].city 


Scenario: complex json reader parser

* def jsonArray =

"""
{"menu": {
  "id": "file",
  "value": "File",
  "popup": {
    "menuitem": [
      {"value": "New", "onclick": "CreateNewDoc()"},
      {"value": "Open", "onclick": "OpenDoc()"},
      {"value": "Close", "onclick": "CloseDoc()"}
    ]
  }
}}

"""

* print jsonArray
* print jsonArray.menu
* print jsonArray.menu.id
* print jsonArray.menu.value
* print jsonArray.menu.popup
* print jsonArray.menu.popup.menuitem
* print jsonArray.menu.popup.menuitem[1].value
* print jsonArray.menu.popup.menuitem[2].onclick