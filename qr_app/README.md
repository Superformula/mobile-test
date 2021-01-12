# qr_app

This is a Flutter project is a cross-platform mobile app that features a QrCode generator and a QRCode scanner.  

## App features

This app has three screens.

1. Home Screen - This is your landing screen when you launch the app.  
   It has a floating action button which when when pressed will show a menu with 2 items:  
   a) Scan - This will take you to the Scan Screen  
   b) QRCode - This will take you to the QR Screen   

2. Scan Screen - This screen will feature a camera view that can scan a QR code and validate it against a previously generated value. There are three possible validation statuses:   
   -  When there is a no match - 'Invalid Code' status.
   -  When there is a match but the code has expired - 'Expired Code' status.
   -  When there is a match - 'Valid' status. 

3. QR Code Screen - This screen will display a QrCode image and a timer. The Qr code and the expiration time is     generated and fetched from a server.  

## Requirements and steps for demo

Note: This project has an accompanying server project. The server is a nodejs application. 

1. The server has to be running for this app to function properly.
2. The app needs to be opened on two different mobile devices.
3. On device 1, navigate to the QR Code screen.
4. On device 2, navigate to the Scan screen and scan the qr code on device 1.  

