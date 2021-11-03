# Installation

This project is two parts:

* The Flutter mobile application
* The Node random seed server

## Using the Node random seed server

The node random seed server is dependent on Node.js and Express. Nodemon was added as a dev dependency for development purposes only.

Getting the node server running requires the following:

* Install Node and NPM on your system
* In your terminal emulator of choice, navigate to the `seed_server` folder.
* Run the command `npm i` to install all package dependencies
* Run the command `npm run start`

You should see a message indicating the server is running.

## Running the Flutter application

Getting the flutter application running should only require navigating to the root folder of this project and running `flutter pub get` to download all package dependencies. From there, you should be able to run the Flutter application in the same way that you would run any other Flutter application.

One configuration measure is required: The application accesses the API using HTTP. The HTTP url for the development server needs to be set in options.dart in the baseUrl getter.