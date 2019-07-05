# Jeff Scaturro's Process

As the main goal of this is to get insight into how I think about and solve a problem, a document of just that may greatly help out. As the intent of this document is to provide that insight, I will keep formatting to a minumum to achieve that "raw" feeling - it'll represent more of a mind dump.

# Discovery Phase

- Given link to repository. Read readme and qr generator test.
- Can use any libraries I normally would in a production App.
- Follow normal best practices. Include testing (might use a test-driven approach for this project).
- Client wants a QR code in their app to identify a profile or feature.
- Need to create an endpoint that generates a random seed to create a QR code (Firebase?)
- App will hit the endpoint, generating QR code based on it.
- Follow Material design (yay!)
- Navigation between Home, QR Code, and Scan.
- Advanced requirements that seem like it should be included in project are: auto-refresh strategy, caching of latest seed, and scanning.

# Planning/Grooming

- Looking up QR code libraries, https://pub.dev/packages/qr_flutter seems to be the most active and up-to-date.
- Create base/template app, add ^ dependency, `/super_qr`
-
