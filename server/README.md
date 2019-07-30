# Firebase Server

The server is a simple https endpoint requiring no authentication to access from the client app.

The endpoint can be accessed at the following url...
```
https://us-central1-qrcode-server.cloudfunctions.net/seed
```

## Development Environment

- Node v8.0
- NPM v5.0 or later

## Firebase Tools
Install firebase-tools globally
```
npm install -g firebase-tools
```

## The Firebase CLI

Please review the docs for the firebase CLI

https://github.com/firebase/firebase-tools


## Firebase Setup
Using the Firebase web console create a new firebase project for the http endpoint.

Project Name: qrcode_server

## How I Initially Set Up the Repo
When I created the firebase project in the repo I followed these steps...

- Create a "server" directory at the root of the repo
- From that directory...
- ```firebase login``` then select the google account
- ```firebase init```
  - Select functions only
  - Select qrcode_server
  - Select typescript
  - Enable tslint
  - Install dependencies with npm

**NOTE:** I use typescript rather than javascript so you'll find the src in functions/src which will be transpiled into javascript and stored in functions/lib which is what is actually uploaded to firebase.

## Firebase Cloud Functions Shell
You can install the cloud functions shell to allow you to run the server functions within a shell environment.

Run the following in the functions directory...

```
npm install --save firebase-functions@latest
```

Then run the shell...

```
firebase functions:shell
```

Now you can call the seed function from the shell...
```
seed()
```

# Building the Server
To build the server without deploying you need to manually transpile the typescript into javascript.

From your functions directory...
```
npm run build
```

This will generate the javascript located in functions/lib. **NOTE: The generated javascript is not checked in**

You can run the server on localhost using the firebase CLI.
```
firebase serve
```

You should see a url in the console similar to this one. Paste into a web browser or run curl.
```
http://localhost:5000/qrcode-server/us-central1/seed
```

You should see the generated seed json output.

# Test Setup

Install firebase-functions-test, Mocha, and Chai, by running the following commands in your functions directory...

```
npm install --save-dev firebase-functions-test
npm install --save-dev mocha
npm install --save-dev chai
```

Next create a test folder inside the functions folder, create a new file inside it for your test code, and name it something like index.test.js.

Finally, modify functions/package.json to add the following...

```
"scripts": {
  "test": "mocha --reporter spec"
}
```

Once you have written the tests, you can run them by entering the following inside your functions directory...
```
npm test
```

# Deploying the Server
```
firebase deploy
```

That's it.
