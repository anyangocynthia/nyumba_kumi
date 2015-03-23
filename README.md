# Nyumba Kumi


## Overview

The URL is: http://ujiraniapp.com/api/v2

Every request must unclude an API token: `token`

## Version 2

### First Screen (Sign Up)

Here, the response from the Facebook or Google+ sing up i.e. `email`, `name` and `photo` is not sent immediately.
Instead, it is sent along with the `phone_number` when the user submits it.
    
    The URL is POST {URL}/sign_up
    
#### Request

    post :sign_up, { name: "John", email: "john@doe.com", phone_number: "254722123456", registration_id: "123456", photo: "path/to/file.jpg" }
    
`registration_id` is the registration id of the device.

#### Response    

    
    { id: 1, status: "success" }
    
    
### User verification

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

### Invite people

    The URL is POST {URL}/invite

    post : { inviter: 1, [{name: "John Doe", phone_number: "254722772838"}, {name: "Jane Doe", phone_number: "254722772832"}]}

    where inviter is current user id

#### Response

    { in_a_group: 3, not_in_a_group: 2 }

### Saving house details

#### List of nearby estates

    The URL is GET {URL}/nearby_estates?latitude=-1.2988742&longitude=36.7895526

##### Response

    [
        {
            "id": 1,
            "house_name": "Barsha",
            "location": "Nairobi",
            "contact_id": 1,
            "created_at": "2014-11-11T15:14:19.031Z",
            "updated_at": "2014-11-11T15:14:19.031Z",
            "latitude": 12.3532523,
            "longitude": 12.3532523
        }
    ]

#### List of all estates

    The URL is GET {URL}/estates

##### Response

    [
        {
            "id": 1,
            "house_name": "Barsha",
            "location": "Nairobi",
            "contact_id": 1,
            "created_at": "2014-11-11T15:14:19.031Z",
            "updated_at": "2014-11-11T15:14:19.031Z",
            "latitude": 12.3532523,
            "longitude": 12.3532523
        }
    ]

#### Save house details

    The URL is POST {URL}/save_house_details

    post : { estate_id: 1, contact_id: 1, appartment_name: "43A" }

##### Response

    {
        "contact_id": "1",
        "estate_id": "1",
        "appartment_id": 4
    }

### User Details (Profile)

    GET {URL}/contacts/{id}

#### Response

    {
        "id": 4,
        "name": "Mohaa",
        "phone_number": "254722123456",
        "group_id": 1,
        "contact_type": "Admin",
        "house_name": "My House",
        "house_number": "40",
        "photo": "41.242.2.154:3001/system/users/photos/000/000/476/original/RackMultipart20141111-21067-1xpy3vr?1415719508",
        "member_since": "19/08/2014 09:15PM"
    }

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
			"contact_type":"Admin"
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
    
    {"notification[contact_id]" => "1", "notification[group_id]" => 1, "notification[message]" => "Hello"}
    
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
      "contact_id": 1,
      "group_id": 1,
      "message": "Hi",
      "time": "08/09/2014 04:24PM"
     },
     {
      "contact_id": 2,
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

    {"contact_id" => "1", "service" => "Security", "location" => "2134353435,123243642"}

#### Response

	
    {group: "1", service: "Security", location: "2134353435,123243642", message: "Hi fellow group members. We have a security situation around here."}
