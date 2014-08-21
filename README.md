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

    The URL is POST {URL}/users/{:id}.json

    Where id is returned as part of the previous response

#### Request
    post { name: "John Doe", phone_number: "254722876889", id_number: "12345687989" }

#### Response

    {
        "id" : 1,
        "status" : "success"
    }

If is_in_a_group is true, the notifications screen is shown else, the create group screen is shown

### Creating a group
    

#### Request    
    
    The Url is POST  {URL}/groups.json
    

#### Response
    
    {
        "id": 3
    }
    

### Adding contacts to group
    
#### Request    
    
    The Url is POST  {URL}/add_members

    post :add_members, {"group" => group_id, users => [{name: "John Doe", phone_number: "254722772838"}, {name: "Jane Doe", phone_number: "254722772832"}]}

group_id comes from the previous response when creating the group
    
    
### Creating a notification

#### Request
    
    The Url is POST {URL}/notifications.json
 
### List of notifications

#### Request
    
    The Url is GET {URL}/notifications
 
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
 
