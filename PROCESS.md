# Process

As the main goal of this is to get insight into how I think about and solve a problem, a document of just that may greatly help out. As the intent of this document is to provide that insight, I will keep formatting to a minumum to achieve that "raw" feeling - it'll represent more of a mind dump.

# Discovery Phase

- Given link to repository. Read readme and qr generator test.
- Can use any libraries I normally would in a production App.
- Follow normal best practices. Include testing (test-driven?).
- Client wants a QR code in their app to identify a profile or feature.
- Need to create an endpoint that generates a random seed to create a QR code (Firebase?)
- App will hit the endpoint, generating QR code based on it.
- Follow Material design (yay!)
- Navigation between Home, QR Code, and Scan.
- Advanced requirements that seem like it should be included in project are: auto-refresh strategy, caching of latest seed, and scanning.

# Planning/Grooming

When developing an app myself, I take on a hybrid of many common development processes involving agile, like kanban and scrum. I look at the project as a whole by understanding what the client needs, and then dive into planning. I don't plan too in depth, but I get it down to a "bullet point presentation" like feel.

- Looking up QR code libraries, https://pub.dev/packages/qr_flutter seems to be the most active and up-to-date.
- Create base/template app, add ^ dependency, `/super_qr`
- Initial thoughts before diving into planning, I'll be dividing this up into the following sections, or epics:
  - Server (Firebase, most likely)
  - App UI - Theme & Navigation
  - App QR Code Service (display & scan)
  - App hitting Server
  - App Testing
  - Server Testing

# Epics / Categories / Chunks of Related Work

Breaking up each "epic" into those "bullet point" type tasks. Not necessarily in order.

## Server

- Get a live server config running.
- GET endpoint that returns a random seed.
  - String: seed
  - DateTime: expires_at
- Handle an error?
- Unit test.

## App UI

- Get template up and running with Home view buttons and views.
- Hook up navigation.
- QR Display Screen.
- QR Scan Screen.
- Loading & error states.
- Tests:
  - Content
  - Navigation

## App QR Code Service

- Service that can:
  - Create a QR code with data.
  - Scan a QR code.
- Error state.
- Unit test consturction.
- Unit test scanning?

## Rest/Network Requests

- Model for `Seed`
- Service that will hit our server and get response, map to new `Seed`.
- Handle offline/errors.
- Unit tests.

## App & Server Testing

Now combined as may not need to do anything specifically here as they should be covered in the above epics.

- Functional test for QR Display.
- Functional test for QR Scan.

Note: At this point I am ready to start developing. I spent about 30 minutes of work to this point, and another 15-30 reading up on QR codes and packages I might want to use.

Note: I am currently ripping (well demolishing) out the ceramic tile floor in my garage this weekend with an already reserved jackhammer rental, so I may save unit tests for the end / skip on those, which I normally wouldn't for a client. I always provide full regression testing and Quality Assurance before handing it back.

Note: I normally don't document much further, but in effort to provide a full solution to this problem, insight into Jeff's brain is critical. The following would normally be summed up in standups/checkins with client / team.

# Development

- Adding firebase functions to project.
- Add cloud_firestore to pub for app. (though we could just use http to manage the gets)
- Add data to GET endpoint, return random seed and expires at.
- Let's get into the flutter app, get it building and running on iOS and Android.
- After getting it to run, I created the home view for the app, just barebones.
- I then created the speed dial (floating action button with menu), utilizing library that already accomplishes this.
- Set up navigation between home, display, and scanning views.
- In order to test displaying a QR code, I'll need dummy data, or create the provider now, doing the latter.
- Starting to build service that will hit our endpoint, auto refresh, maybe use an observable pattern, and only run in display view?
- Only one listener, so a basic stream can be used here.
- Fixed data server, needs to return `data: {...}`.
- Created QR code view.
- Let's add ability to scan a QR code.
- flutter_barcode_scanner or qr_code_scanner? flutter_barcode_scanner looks like it has more flexibility, and permission handling. Latter also looks slower.
- Snackbar opens links, or it displays the seed data.
- Need to add a validate endpoint to check QR Code scan. This would take in the `expires_at` as a parameter?
- Need to change auto refresh to happen when code expires.

# Testing

- End to end functional testing on my Android & iPhone devices. I test on device on an Apple iPhone X and Google Pixel 3. I test on simulators I'm worried about.
- Test experience on small screen sizes.
- Can utilize device farms if worried about different rendering on different sizes.

# Release

- Normally, we'd want to get this app released!
- I have plenty of experience in this area, see my apps in both the Google Play Store and the Apple App Store.
