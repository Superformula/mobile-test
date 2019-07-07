# Super-QR

An app that generates a random QR code every 15 seconds and can also read existing QR codes. Developed as a solution to Superformula's "QR-generator-test".

# Running Locally

## Server

To make changes to the Server (Firebase Functions):

- `cd functions`
- `npm install`

To deploy changes to Firebase Functions (need access to Firebase App):

- `firebase deploy --only functions`

## App

To build and run the app:

- `cd super_qr`
- `flutter build apk` (android)
- `flutter build ios` (ios)

To build an Android .apk to release:

- `flutter build appbundle --target-platform android-arm,android-arm64`

To build an iOS app to release:

- `flutter build ios` and release through Xcode.

# Troubleshooting

You may need to update your source repos for cocoapods:

- `cd super_qr/ios`,
- then `pod repo update` or `pod install --repo-update`

# Process

Interested in the Process in creating this application and server? Check out [process.md](process.md).

I often look at "awesome-X" repos like [awesome-flutter](https://github.com/Solido/awesome-flutter) for packages that can help me accomplish my task sooner, evaluating if I should pull it in, or should roll a custom build. If the project looks outdated and has a lot of open issues, I tend to roll my own. If it looks up to date but its unstable, I also tend to roll my own, or pull it in and contribute to it.

# Server

The server used in this project is running on Firebase, and utilizes Firebase Functions. I contemplated spinning up an Express server, but I've utilized Firebase Functions in recent production apps, and really like the speed and efficiency of it. It provides exactly what we need for this project, with no drawbacks in this context.

# App

Obviously, Flutter! <3
