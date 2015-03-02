# Nyumba Kumi


## Overview

The URL is: http://ujiraniapp.com/api/v1

Every request must unclude an API token: `token`

### First Screen (Sign Up)
    
    The URL is POST {URL}/sign_up
    
#### Request

    post :sign_up, { number: "254722123456", registration_id: "123456" }


#### Response    

    
    { user_id: 1, is_in_a_group: true/false, profile_setup: true/false, verified: true/false }
    
    
### User verification

    If, from the previous response, verified is false, the user should be taken to the verification screen.

#### Request

    The URL is POST {URL}/verify

    post : { verification_code: "123456", id: 1 }

#### Response

##### Successfull verification (Verification code matches what is expected)

    {
        "id": 1,
        "verified": true,
        "status": "User verified successfully!"
    }

##### Trying to verify after a successfull verification

    {
        "id": 1,
        "verified": true,
        "status": "User has already been verified!"
    }

##### Unsuccessfull verification (Verification code doesn't match what is expected)

    {
        "id": 1 ,
        "verified": false,
        "status": "Wrong verification code! Please try again."
    }

### Setting up a Profile

    If profile_setup is false, the user should be given a way to update their profile

    The URL is PUT {URL}/users/{:id}.json

    Where id is returned as part of the previous response

#### Request
    
    put { name: "John Doe", id_number: "12345687989", house_id: "1", house_number: "200", photo: 'path/to/file.jpg/png..' }
    
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

If is_in_a_group is true, the completing profile  screen is shown else, the create group screen is shown

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
        "house_name": "My House",
        "house_number": "40",
        "photo": "41.242.2.154:3001/system/users/photos/000/000/476/original/RackMultipart20141111-21067-1xpy3vr?1415719508",
        "member_since": "19/08/2014 09:15PM"
    }

### Creating a group
    

#### Request    
    
    The Url is POST  {URL}/groups.json

    post {"group_name" => "Group 1", "location" => "Some location", "user_id" => "Group admin id"}
    

#### Response
    
    If group doesn't exist in the database: (ie group_name should be unique)
    
    {
        "id": 3
        "status" : "success"
    }
    
    else

    {
        "id": 8,
        "status": "Group already exists!"
    }

    If a user who is already in a group tries to create another group, response is:

    {
        "error": "You already belong to group_name."
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
      "in_a_group":true,
			"group_id":134,
			"user_type":"Admin"
		},
		{
			"id":102,
			"name":"Jane Doe",
			"phone_number":"0700123456",
			"id_number":12324352421,
      "in_a_group":true,
			"group_id":134
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

### Handling panic menu actions

#### Request

This will happen when a user chooses one of the items in the panic menu

    
    The Url is POST {URL}/panic_menu_actions

    {"user_id" => "1", "service" => "Security", "location" => "2134353435,123243642"}

#### Response

	
    {group: "1", service: "Security", location: "2134353435,123243642", message: "Hi fellow group members. We have a security situation around here."}
