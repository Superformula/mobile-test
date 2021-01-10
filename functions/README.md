# Functions

This is a Firebase Functions project which contains a Node/Express API.

## Getting Started

Install the Firebase CLI, then run the cloud functions locally:

```
npm install -g firebase-tools

firebase emulators:start --only functions
```

You may need to select/start a Firebase project. If that's the case, do:

```
firebase login

firebase init
```

And follow the CLI instructions.

For more information refer to:
- [Firebase get started](https://firebase.google.com/docs/functions/get-started)

## Endpoints

**Get Seed**
----
  Returns a seed that can be used to generate a QR code

* **URL**

  /seed

* **Method:**

  `GET`
  
*  **URL Params**

   **Required:**
 
   `name=[string]`

* **Data Params**

  None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{ seed : 'base64 string', expires_at : 'dateTime string' }`
 
* **Error Response:**

  * **Code:** 500 Internal Server Error <br />
    **Content:** `{ error : 'error description' }`

* **Sample Call:**

  ```javascript
    $.ajax({
      url: "/seed",
      dataType: "json",
      type : "GET",
      success : function(r) {
        console.log(r);
      }
    });
  ```
## Test

This project uses Jest. To run the tests type:

```
npm test
```
