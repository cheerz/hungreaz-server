# Getting Started

The base url is :

    api/1/

Session token must be passed through a header:

    "Session-Token" => "..."

This token is needed for almost every endpoint, except:
    - users#create
    - sessions#create

# API

API specifications

1. [Users Controller](#users-controller)
    - [create](#1-create)
    - [show](#2-show)
2. [Sessions Controller](#sessions-controller)
    - [create](#1-show)
    - [destroy](#2-destroy)
3. [Places Controller](#places-controller)
    - [create](#1-create)
    - [index](#2-index)
4. [PlaceCategories Controller](#place_categories-controller)
    - [index](#1-index)


## Users Controller

### 1. Create

    POST /users

#### Example request:
    {
        "user": {
            "email": 'jean@cheerz.com',
            "password": 'password',
            *"nickname": 'el-caid'
        }
    }

If blank, the `nickname` will be set with the first part of the email (here: "jean").

#### Example response:

##### Header
    200 OK

##### Body
    {
        "email": "jean@cheerz.com'",
        "nickname": jean"
    }  

### 2. Show

    GET /user

#### Example response:

##### Header
    200 OK

##### Body
    {
        "email": "jean@cheerz.com",
        "nickname": "jean"
    }



## Sessions Controller

### 1. Create

    POST /sessions

#### Example request:
    session: {
        "email": "jean@cheerz.com,
        "password": "password"
    }

#### Example response:

##### Header
    200 OK

##### Body
    {
        "email": "jean@cheerz.com",
        "nickname": "jean"
    }

### 2. Destroy

    DELETE /session

#### Example response:

##### Header
    200 OK

##### Body
    {}



## Places Controller

### 1. Create

    POST /places

#### Example request:
    place: {
        "name": "Cheerz Palace"
        "lng": 2.32590994,
        "lat": 48.88060188,
        "first_image_url": "http://..." ,
        "second_image_url": "http://...",
        "third_image_url": "http://...",
        "fourth_image_url": "http://...",
        "fifth_image_url": "http://...",
        "place_category_tag": "food",
        "user_email": "jean@cheerz.com"
    }

#### Example response:

##### Header
    200 OK

##### Body
    {
        "name": "Cheerz Palace"
        "lng": 2.32590994,
        "lat": 48.88060188,
        "first_image_url": "http://..." ,
        "second_image_url": "http://...",
        "third_image_url": "http://...",
        "fourth_image_url": "http://...",
        "fifth_image_url": "http://...",
        "place_category_tag": "food",
        "user_email": "jean@cheerz.com",
        "events": []
    }

### 2. Index

    GET /places

#### Example request:
    {
        "lng": 2.32590994,
        "lat": 48.88060188,
        *"meter_distance": 100
    }

The default value for `meter_distance` is 500.

#### Example response:

##### Header
    200 OK

##### Body
    [
        {
            "name": "Cheerz Palace"
            "lng": 2.32590994,
            "lat": 48.88060188,
            "first_image_url": "http://..." ,
            "second_image_url": "http://...",
            "third_image_url": "http://...",
            "fourth_image_url": "http://...",
            "fifth_image_url": "http://...",
            "place_category_tag": "food",
            "user_email": "jean@cheerz.com",
            "events": [
                {
                    "start_at": "2018-07-26 21:10:50 UTC", 
                    "stop_at": "2018-07-26 22:20:50 UTC", 
                    "participants_emails": ["jean", "daniela", "lord-duck"]
                },
            ]
        },
        {
            ...
        },
    ]



## PlaceCategories Controller

### 1. Index

    GET /place_categories

##### Header
    200 OK

#### Example response:
    [
        {
            "tag": "food",
            "name": "Food",
        },
        {
            "tag": "drinks",
            "name": "Drinks",
        },
        ...
    ]