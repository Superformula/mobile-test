# Running the app

The server is located in the `server/` directory with has a `README.md` with the instructions needed to run the API. Once the server has been run with `dart run server.dart`, you can do the following:

 1. Start the app (if you haven't already)
 2. Tap the FAB on the bottom-right corner and pick the first option (Fetch QR)
 3. You'll see that the app fetches a seed and generates a QR. After 15 seconds, the QR code is automatically refreshed

If you stop the server or if you don't run it at all, a friendly error message appears. There's also a "Retry" button so you can try to turn off the server, see the error, turn it on again and retry. For the QR scan part instead:

 1. Start the app (if you haven't already) or just go back
 2. Tap the FAB on the bottom-right corner and pick the second option (Scan QR)
 3. Scan any QR code representing a string of lenght 32 (or shorter) to see a "Validation success" message

For sake of simplicity, a valid QR code is any string whose length is <= 32 but of course a more complex logic can be implemented. You'll also find more technical details in the inline code documentation.

# Notes

 - I have tested the app on an Android emulator and a physical Android device (Samsung Galaxy Tab A).
 - I don't have an iPhone or an iPad to make tests there as well.
 - The code is entirely documented so you may find more specific info directly in the `.dart` files.