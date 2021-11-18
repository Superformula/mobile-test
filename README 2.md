# qr_code_test

QrCode Test is an app used to generate and display a qr code that is based on a seed that is fetched from a server. This qr code is refreshed automatically when the fetched data expires.

### Dependencies 
  > flutter_dotenv: ^5.0.2,  
  > qr_flutter: ^4.0.0,  
  > qr_code_scanner: ^0.6.1,  
  > simple_speed_dial: ^0.1.3,  
  > http: ^0.13.4,  
  > provider: ^6.0.1,  
  > hive_flutter: ^1.1.0,  
  > hive: ^2.0.4,  
  > connectivity: ^3.0.6,
  
  
### How it works (High Level)
The home page holds a Text widget and a Pop Out Floating Action button with two options, "Scan" and "QR Code". 
"Scan" navigates the user to another screen which opens the camera to scan a qr code and presents the seed information in a text widget. 

The "QR Code" option, on the other hand, when tapped, checks if there is an internet connection, if there is one and there is a seed currently stored in the on device database we assume that code hasn't expired and and the app navigates the user to the screen to view the QR Code.
If there is no seed in the device storage, the method `getSeed` is called, that new seed is stored and app navigates to the Qr Code screen. 
If there isn't a seed, and the `getSeed` function returns a `null` value then a message is displayed on the home screen. 
If there is no connection and a seed was stored, the app navigates to the Qr Code screen. If there is no connection and also no stored seed, the app displays appropriate message on the home screen.
  
### Code Snippets  


Function connected returns true if device is connected via mobile or wifi
```
Future<bool> connected() async {
  ...
}
```

Hive Services is a class with one static method which gets the storage box "seed" and allows for all the operations of a Hive Box
```
class HiveServices {
  static Box<Seed> getSeedFromMemory() => Hive.box<Seed>("/*name of box*/");
}

```


