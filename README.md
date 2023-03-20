
<center><h1>Questions API</h1></center>

## Table of Contents 

## About the Project

## Setup

## Built With 

## Endpoints
- Endpoints are run through GraphQL queries and mutations 

<details close>
  <summary>Find All Users</summary><br>

Returns a list of all current users in database.<br>

```query
query {
    users {
        id
        name
        email
    }  
}
```

Expected Response:

 ```json
{
    "data": {
        "users": [
            {
                "id": 1,
                "name": "Louie"
            },
            {
                "id": 2,
                "name": "Zoe"
            }
        ]  
    }
}
```
</details><br>

<details close>
  <summary>Find All Tech Questions</summary><br>

Returns a list of all Tech Questions in the database<br>

```query
query {
    tQuestions {
        id
        question
        qType
    }  
}
```

Expected Response:

 ```json
{
  "data": {
    "tQuestions": [
      {
        "id": "1",
        "question": "Clear your mind must be, if you are to find the villains behind this plot.",
        "qType": 0
      },
      {
        "id": "2",
        "question": "Soon will I rest, yes, forever sleep. Earned it I have. Twilight is upon me, soon night must fall.",
        "qType": 0
      },
      {...}
    ]}
}
```
</details><br>


<details close>
  <summary>Find All Behavioral</summary><br>

Returns a list of all Behavioral Questions in the database<br>

```query
query {
  bQuestions {
    id 
    question
  }
}
```

Expected Response:

 ```json
{
  "data": {
    "bQuestions": [
      {
        "id": "1",
        "question": "Why do you want to work for X company?"
      },
      {
        "id": "2",
        "question": "What are you looking for in your next role?"
      },
      {
        "id": "3",
        "question": "Tell me about a time when you had a conflict with a co-worker."
      },
      {...}
    ]}
}
```
</details><br>


<details close>
  <summary>Find a User's Answered Questions</summary><br>

Returns a list of tech and behavioral questions that a user has answered.<br>

```query
query {
  user(id:3){
    userTQuestions {
      id
      userId
      tQuestionId
     	answer 
      status
      tQuestion {
        question
        qType
      }
    } 
    userBQuestions {
      id
      userId
      bQuestionId
     	answer 
      status
      bQuestion {
        question
      }
    } 

  }
}
```

Expected Response:

 ```json
{
  "data": {
    "user": {
      "name": "Johnathan Botsford",
      "email": "joaquina@zemlak.io",
      "userTQuestions": [
        {
          "id": "3",
          "userId": 3,
          "tQuestionId": 3,
          "answer": "I regret that I should leave this world without again beholding him.",
          "status": 0,
          "tQuestion": {
            "question": "Ow, ow, OW! On my ear you are!",
            "qType": 0
          }
        }
      ],
      "userBQuestions": [
        {
          "id": "1",
          "userId": 3,
          "bQuestionId": 3,
          "answer": "",
          "status": 0,
          "bQuestion": {
            "question": "Tell me about a time when you had a conflict with a co-worker."
          }
        },
        {
          "id": "2",
          "userId": 3,
          "bQuestionId": 3,
          "answer": "",
          "status": 0,
          "bQuestion": {
            "question": "Tell me about a time when you had a conflict with a co-worker."
          }
        },
        {...}]
    }}
}
```
</details><br>


<details close>
  <summary>Answer a Tech Question for a User</summary><br>

Saves that question and answer to that user<br>

```mutation
mutation {
  createUserTQuestion(input: {userId: 1, tQuestionId: 3, answer: "hello there!"}){
    userTQuestion {
      id
      userId
      tQuestionId
      status
      answer
      tQuestion {
        question
      }
    }
  }
}
```

Expected Response:

 ```json
{
  "data": {
    "createUserTQuestion": {
      "userTQuestion": {
        "id": "10",
        "userId": 1,
        "tQuestionId": 3,
        "status": 1,
        "answer": "hello there!",
        "tQuestion": {
          "question": "Ow, ow, OW! On my ear you are!"
        }
      }
    }
  }
}
```
</details><br>


<details close>
  <summary>Answer a Behavioral Question</summary><br>

Saves that question and answer to that user<br>

```mutation
mutation {
  createUserBQuestion(input: {userId: 1, bQuestionId: 3, answer: "hello there!"}){
    userBQuestion {
      id
      userId
      bQuestionId
      status
      answer
      bQuestion {
        question
      }
    }
  }
}
```

Expected Response:

 ```json
{
  "data": {
    "createUserBQuestion": {
      "userBQuestion": {
        "id": "21",
        "userId": 1,
        "bQuestionId": 3,
        "status": 1,
        "answer": "hello there!",
        "bQuestion": {
          "question": "Tell me about a time when you had a conflict with a co-worker."
        }
      }
    }
  }
}
```
</details><br>



<details close>
  <summary>Update a User's Tech Question</summary><br>

The status of the question can be updated so the user can star or unstar a question. The answer can also be updated<br>

```mutation
mutation {
  updateUserTQuestion(input: {id: 1, userId: 1, tQuestionId: 1, answer: "hello there!", status: 1}){
    userTQuestion {
    id 
    answer
    userId
    tQuestionId
    status
      
    
    }
  }
}
```

Expected Response:

 ```json
{
  "data": {
    "updateUserTQuestion": {
      "userTQuestion": {
        "id": "1",
        "answer": "hello there!",
        "userId": 1,
        "tQuestionId": 1,
        "status": 1
      }
    }
  }
}
```
</details><br>



<details close>
  <summary>Update a User's Behavioral Question</summary><br>

The status of the question can be updated so the user can star or unstar a question. The answer can also be updated<br>

```mutation
mutation {
  updateUserBQuestion(input: {id: 1, userId: 1, bQuestionId: 1, answer: "hello there!", status: 1}){
    userBQuestion {
    id 
    answer
    userId
    bQuestionId
    status
      
    
    }
  }
}
```

Expected Response:

 ```json
{
  "data": {
    "updateUserBQuestion": {
      "userBQuestion": {
        "id": "1",
        "answer": "hello there!",
        "userId": 1,
        "bQuestionId": 1,
        "status": 1
      }
    }
  }
}
```
</details><br>