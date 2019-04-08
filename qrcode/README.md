# QRCode Flutter App

This application allows the user to fetch a seed value and display it as a QRCode.  The seed
is represented as a string and retrieved from a backend server with an expiration time.  Another
screen allows the user to scan a barcode.

The general architecture is represented in the graphic below.  The screens are made up of Flutter
widgets which utilize business logic classes called Blocs.  These Blocs are given an Environment class
that holds a Map of Managers responsible for encapsulating specific functionality.


![General Architecture](https://github.com/mmaitlen/mobile-test/blob/master/docs/qrcode_architecture.png)

The Managers utilized in the QRCode app are as follows
- DataMgr: Responsible
