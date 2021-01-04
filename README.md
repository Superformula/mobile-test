# Running the app

The server is located in the `server/` directory which has a `README.md` with the instructions needed to run the API. Once the server has been run with `dart run server.dart`, you can do the following:

 1. (`static/1.jpg`) Start the app (if you haven't already).
 2. (`static/2.jpg`) Tap the FAB on the bottom-right corner and pick the first option (Fetch QR).
 3. (`static/3.jpg`) You'll see that the app fetches a seed and generates a QR. After 15 seconds, the QR code is automatically refreshed.

If you stop the server or if you don't run it at all, a friendly error message appears. There's also a "Retry" button so you can try to turn off the server, see the error, turn it on again and retry. For the QR scan part instead:

 1. (`static/1.jpg`) Start the app (if you haven't already) or just go back.
 2. (`static/2.jpg`) Tap the FAB on the bottom-right corner and pick the second option (Scan QR).
 3. (`static/5.jpg`) Scan any QR code representing a string of lenght 32 or shorter (`static/6.jpg`) to see a "Validation success" message.

For sake of simplicity, a valid QR code is any string whose length is <= 32 but of course a more complex logic can be implemented. You'll also find more technical details in the inline code documentation.

# Notes

 - I have tested the app on an Android emulator and a physical Android device (Samsung Galaxy Tab A).
 - I don't have an iPhone or an iPad to make manual tests there as well.
 - The code is entirely documented so you may find more specific info directly in the `.dart` files.

Since I run the app on an Android emulator, I use `Configurations.baseHttpEndpointAndroid` from the `configurations.dart` file. Make sure to change this to `Configurations.baseHttpEndpoint` if you're running on anything else which is not an Android emulator device.

# Resources

See the `static` folder with some screenshots of the app.