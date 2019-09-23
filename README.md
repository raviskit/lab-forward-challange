# lab Forward Backend Challange

## System Requirements
App is built using Ruby 2.5.0 and Rails 5.2.3


## Running instructions
Clone the application in local using 

`
    git clone https://github.com/raviskit/lab-forward-challange.git
`

cd into the directory and run ` bundle install `

then setup the db using ` rails db:create && rails db:migrate && rails db:seed`

run the server using ` rails s`

server will be up at ` http:// localhost:3000/`


## Queries

1. get the signal output by providing a signal input and threshold:

```
Input:

Request Type: POST

URL: "http://localhost:3000/api/v1/data_inputs/output"
data: {"input": "[1, 2, 3, 4,1 ,5, 6, 1, 2, 1.1, 2.2, 0]", "threshold": "3" }
foramt: :json
```

example:

 ![input example](./public/input.png?raw=true "input example")
 
Output:

``
    {
        "signal": [
            0,
            0,
            0,
            1,
            0,
            1,
            1,
            0,
            0,
            0,
            0,
            0
        ],
        "message": "output generated successfully"
    }
``

2. You can also query for signal outputs based on the signal saved in the db. 
For this query you just have to provide an start_date and end_date params.

First of all add some signal input to db using this query:

```
POST:
    http://localhost:3000/api/v1/data_inputs/
    data: {"input": "[1, 2, 3, 4,1 ,5, 6, 1, 2, 1.1, 2.2, 0]", "threshold": "3" }
    
```

This will create a successful record in db and produce output like this:
```
{
    "signal": {
        "id": 20,
        "input": "[1, 2, 3, 4,1 ,5, 6, 1, 2, 1.1, 2.2, 0]",
        "threshold": "3",
        "created_at": "2019-09-23T10:27:03.305Z",
        "updated_at": "2019-09-23T10:27:03.305Z"
    },
    "message": "input added successfully"
}
```

You can add as many signals as you want in the DB this way.

Now to query a signal between two dates, Make a request like this:
```
POST:
URL: http://localhost:3000/api/v1/data_inputs/output
params: { start_date: "dd/MM/YYYY", end_date: "dd/MM/YYYY" } # remember the format

```

make sure to pass the dates in the correct format provided above

Output will be like this:
```
{"signal":[
    [0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0],
    [0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,1,1,0,0,0],
    [0,0,0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0],
    [0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,1,1,0,0,0],
    [0,0,0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0]],
    "message":"output generated successfully"}
```

## Approach

The REST based App is built using TDD based mode of development. You have option of getting the output signal based on input provided and also can fetch the signal spike for a particular date period.
First listed all the possible scenarios in the specs and started working accordingly.

## Specs

Specs are added for all the controller and model actions. To run the specs:

` rspec spec `


