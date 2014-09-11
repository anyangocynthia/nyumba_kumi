# Nyumba Kumi


## Overview

The URL is: http://41.242.2.154:3001/

### First Screen (Sign Up)
    
    The URL is POST {URL}/sign_up
    
#### Request

    post :sign_up, { number: "254722123456" }


#### Response    

    
    { user_id: 1, is_in_a_group: true/false, profile_setup: true/false, verified: true/false }
    
    

### Setting up a Profile

    If profile_setup is false, the user should be given a way to update their profile

    The URL is PUT {URL}/users/{:id}.json

    Where id is returned as part of the previous response

#### Request
    
    put { name: "John Doe", phone_number: "254722876889", id_number: "12345687989", house_id: "1", house_number: "200" }
    
NB: If you are using postman to test, you will need to wrap the resource name around the parameters e.g. 
user[name], user[phone_number], etc. Especially when you are doing a PUT/PATCH request. The same will 
apply for the other resources.

#### Response

    {
        "id": 4,
        "name": "Mohaa",
        "phone_number": "254722123456",
        "group_id": 1,
        "user_type": "Admin",
        "member_since": "19/08/2014 09:15PM"
    }

If is_in_a_group is true, the notifications screen is shown else, the create group screen is shown

### User Details (Profile)

#### Request

    GET {URL}/users/{id}.json

#### Response

    {
        "id": 4,
        "name": "Mohaa",
        "phone_number": "254722123456",
        "group_id": 1,
        "user_type": "Admin",
        "member_since": "19/08/2014 09:15PM"
    }

### Creating a group
    

#### Request    
    
    The Url is POST  {URL}/groups.json
    

#### Response
    
    {
        "id": 3
        "status" : "success"
    }
    

### Adding contacts to group
    
#### Request    
    
    The Url is POST  {URL}/add_members

    post :add_members, {"group" => group_id, users => [{name: "John Doe", phone_number: "254722772838"}, {name: "Jane Doe", phone_number: "254722772832"}]}

group_id comes from the previous response when creating the group

### Group Members

#### Request

	The URL is GET {URL}/groups/{group_id}/members
	
#### Response

	[
		{
			"id":101,
			"name":"Jone Doe",
			"phone_number":"254722123456",
			"id_number":1233435343,
			"group_id":134,
			"user_type":"Admin"
		},
		{
			"id":102,
			"name":"Jane Doe",
			"phone_number":"0700123456",
			"id_number":12324352421,
			"group_id":134,
		}
	]
    
### Creating a notification

#### Request
    
    The Url is POST {URL}/notifications.json
    
    {"user_id" => "1", "group_id" => 1, "message" => "Hello"}
    
#### Response

    {
      "id": 1,
      "status": "success"
    }
 
### List of notifications

#### Request
    
    The Url is GET {URL}/group_notifications
    
#### Response

    [
     {
      "user_id": 1,
      "group_id": 1,
      "message": "Hi",
      "time": "08/09/2014 04:24PM"
     },
     {
      "user_id": 2,
      "group_id": 1,
      "message": "Hi",
      "time": "08/09/2014 04:30PM"
     }
    ]
 
### List of services and companies

#### Request

This will be used when creating a group to provide a list of services and companies for the group admin to choose

    
    The Url is GET {URL}/services_and_companies
 
#### Response
    
    {
        "Security": [
            {
                "id": 1,
                "name": "G4S",
                "service_id": 1,
                "location": "CBD",
                "phone_number": "254711223344",
                "created_at": "2014-08-03T18:31:47.910Z",
                "updated_at": "2014-08-03T18:31:47.910Z"
            }
        ]
    }
 
### Saving services and companies to group

#### Request

Send in the group id, and an array of arrays with service id and company id as elements. These should be the ones selected. Again, these IDs are available from the previous response

    
    The Url is POST {URL}/add_services

### List of services and companies a group is subscribed to

#### Request

This will be used in the list of companies given to the user when they tap the panic button

    
    The Url is GET {URL}/group_services?id=group_id

#### Response

	
    {"service1" => "company1", "service2" => "company2"}	
