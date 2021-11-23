# qr-generator
Project: QR Generator/Validator Flutter App 

Project version: 0.1

## Overview 

We designed a mobile application interface in Flutter to communicate with a Node.js backend server to issue and validate seed phrases through QR codes.
The Flutter app uses MVVM Architecture to separate business logic from user interface. 


# Flutter App

How to run: 

1. Clone project 

2. Find your IPv4 address (Flutter will not work with localhost as address):

I.Run in your terminal **ipconfig**

Ii. Find your Internet connection and _copy your IPv4 address_


3. In the Flutter project, find the files _http_client_ and _qr_repository_ and replace the IPv4 address with the one you just copied 
Note: result should look like “xxx.xxx.x.xxx:8080”

4. Run in your terminal **flutter run**
