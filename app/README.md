Configuration
Please update app/build.gradle NODE_SERVER field to point to wherever the server is running.
Furthermore, update network_security_config in the XML resource folder to also point to the server

Addendum - Other Capabilities
Caching:  
I mentioned in a TODO that LiveData or Realm could be used to cache the QR code string/expiration and use that to 
load the QR code on launch.  The exipration time could be used to clear those out.

Validating:
The app written in node is extremely rudimentary.  If the node server stored the QR code in a database, that could be 
verified with the post endpoint that was written (as of now, that endpoint only returns false for validation).  It could be
further enhanced using various other methods, such as a passphrase salted, etc.  The zxing library would be used to convert
the qr code back to a string, which would be validated against that endpoint.

Addendum - Testing
I am somewhat unfamiliar with automation.  While I have used uiautomator in the past, I am not completely familiar on how to
set it up.  One of my goals for this year was to change that. Given more time, I would have liked to set up a wiremock server
to provide faked api data, and use that to verify that the QR code displays, along with the auto-refresh feature.

As for testing the main activity, if dagger were set up in this project, it could be used to inject the api service.  By doing
so, a mocked api could be injected when running tests, which would allow for actually testing the activity with Robolectric.
