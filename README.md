# Superformula QR-Scan Mobile Developer Coding Test

![](./app/src/main/res/mipmap-xxxhdpi/ic_launcher.png)

### Building

1) Download and setup the Android SDK and Android Studio
2) Clone this [repository](https://github.com/surf2b1/mobile-test)
3) Build and deploy the app to an emulator or device

### Server

The backend is using Google Firebase Functions.

You can run firebase commands locally:

```bash
firebase serve --only functions
```

And deploy the cloud functions to your project:

```bash
firebase deploy --only functions
```

More information on setting up Firebase and running cloud functions can be found [here](https://cloud.google.com/functions/docs/tutorials/).

### App

The app uses [Dagger2](https://github.com/google/dagger), [RxJava](https://github.com/ReactiveX/RxJava), and [Android Architecture Components](https://developer.android.com/topic/libraries/architecture/) for a clean, solid, and maintainable code. [Mockito](https://site.mockito.org/) and [JUnit](https://junit.org/junit4/) are used for unit tests. The app has a single activity and uses fragments. A ViewModel and LiveData are used to avoid memory leaks and handling orientation changes.