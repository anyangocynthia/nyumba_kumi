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

### Creating a group
    

#### Request    
    
    The Url is POST  {URL}/groups.json
    

### Adding contacts to group
    
#### Request    
    
    The Url is POST  {URL}/add_members

    post :add_members, {"group" => group_id, users => [{name: "John Doe", phone_number: "254722772838"}, {name: "Jane Doe", phone_number: "254722772832"}]}
    
    
### Creating a notification

#### Request
    
    The Url is POST {URL}/notifications.json
 
