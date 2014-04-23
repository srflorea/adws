For more futures you can find this project documentation here: http://docs.adws.apiary.io/.

FORMAT: 1A
HOST: https://architectural-decisions.herokuapp.com

# Architectural Decision Web Service

<code>NOTE:</code> This document is a **work in progress**.

Designing a software system can be viewed as a sequence of decisions taken. 
In order to make decision documentation available to the complete software 
engineering environment, we needed a central decision repository that allows
to store, access, and update decisions in a multi-tool and multi-user 
environment. This web service provides the functionality to store, to retrieve, to delete and to 
update decisions and related information.

# **Allowed HTTPs requests:**
* <code>POST</code> - To create or update resource
* <code>PUT</code> - To create or update resource
* <code>GET</code> - Get a resource or list of resources
* <code>DELETE</code> - To delete resource

# **Description Of Usual Server Responses:**
* _200_ <code>OK</code> - the request was successful (some API calls may return 201 instead).
* _201_ <code>Created</code> - the request was successful and a resource was created.
* _204_ <code>No Content</code> - the request was successful but there is no representation to return (i.e. the response is empty).
* _400_ <code>Bad Request</code> - the request could not be understood or was missing required parameters.
* _401_ <code>Unauthorized</code> - authentication failed or user doesn't have permissions for requested operation.
* _403_ <code>Forbidden</code> - access denied.
* _404_ <code>Not Found</code> - resource was not found.
* _405_ <code>Method Not Allowed</code> - requested method is not supported for resource.
* _429_ <code>Too Many Requests</code> - exceeded GoodData API limits. Pause requests, wait up to one minute, and try again.
* _503_ <code>Service Unavailable</code> - service is temporary unavailable (e.g. scheduled Platform Maintenance). Try again later.

# Group User
This section containts all the methods for manipulating a user profile. **To be continued**

## Signup [/api/v1/signup]

### Create a new user [POST]
+ Request (application/json)

        { 
            "user": 
                { 
                    "name": "Chair",
                    "email": "chair@chair.com", 
                    "password": "password", 
                    "password_confirmation": "password" 
                } 
        }

+ Response 201 (application/json)

        { 
            "message": "Succes" 
        }

## Authentication [/api/v1/signin]
Use this resource in order to login or logout from the API.

### Create a new session - Login [POST]
In order to access resources from this API you will need firstly to create a
session. In order to be able to create a session you previously should have
signed up.After sining up, use this resource by submitting the email and the
password that you have provided signing up. The API will provide you an 
access token which will have to be sent with each request.
+ Request (application/json)

        { 
            "session": 
                { 
                    "email": "chair@chair.com", 
                    "password": "password" 
                } 
        }
    
+ Response 201 (application/json)
    + Body

            { 
                "message": "Succes"    
            }

### Destroy a session - Logout [DELETE]
Use this resource for distroying a session.
+ Response 204

#Group Decision
Use this resource for adding, updating, deleting or just retrieval of 
resources.

## GET /decisions/{?remember_token}
Use this resource for retrieving a group of decisions.

+ Parameters
     + remember_token (string) ... The access token.

+ Response 200
    + Body 
    
            [
                {
                    "id":1,
                    "name":"First",
                    "group_id":1,
                    "project_id":2,
                    "decision_url":"http://localhost:3000/api/v1/decisions/1-first",
                    "versions":
                        [
                            {
                                "id":1,
                                "number":1,
                                "state":"proposed"
                            }
                        ]
                }
            ]

## POST /decisions{?remember_token}
Use this resource for adding a new decision.

+ Parameters
    + remember_token (string) ... The access token.

+ Request (application/json)

        { 
            "decision": 
                { 
                    "name": "First", 
                    "group_id": "1", 
                    "project_id": "2"
                } 
        }
    
+ Response 200 (application/json)
    + Body

            { 
                "message": "Succes" 
            }


## GET /decisions/{id}{?remember_token}
Use this resource for retrieving a certain decision with a certain id.

+ Parameters
    + id (string) ... ID of a decision.
    + remember_token (string) ... The access token.
    
+ Response 200
    + Body 
    
            [
                {
                    "id":1,
                    "name":"First",
                    "group_id":1,
                    "project_id":2,
                    "decision_url":"http://localhost:3000/api/v1/decisions/1-first",
                    "versions":
                        [
                            {
                                "id":1,
                                "number":1,
                                "state":"proposed"
                            }
                        ]
                }
            ]