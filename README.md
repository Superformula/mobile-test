# superformula_qr_code

A Superformula coding challenge.

---

### Running the server

First we need to start the server by running `node .` in the terminal. This will create the local api server to generate the random seeds for our QR codes.

After that we can run the application, which will immediately take us to the Home screen.

### Home Screen

On the Home screen we can tap on the floating action button to open up a menu consisting of our Scan and Qr Code screen.

Tapping on either will navigate, with a slight animation, to that screen.

### Scan Screen 

The Scan screen will ask for our permission to use the camera.

After accepting it will display an overlay in the center of the screen that will allow us to scan a Qr Code.

Upon scanning a code, the text at the bottom will display the data retrieved from the code.

### QR Code Screen

The QR Code Screen displays a QR Code generated from the call to the api. Underneath the QR Code is a timer that is counting down from 15. 

Once the timer is up, the QR code vanishes and is replaced by "Time's up!" and a refresh button underneath it, to get a new QR code.