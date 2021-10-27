# massula_test

This is a flutter qr code generator and reader.

## What expect
### Home
<img src="app_preview/home.PNG" width="500">

### Home Menu
<img src="app_preview/home_menu.PNG" width="500">

### QR Code Scan (Check Notes)
<img src="app_preview/qr_code_scan.PNG" width="500">

### QR Code Generator
<img src="app_preview/qr_code_generator.PNG" width="500">

## How it was designed
The project structure was splited by [folder-by-type](https://softwareengineering.stackexchange.com/questions/338597/folder-by-type-or-folder-by-feature):

    - cubit
        - Business logic layer
    - models
        - data layer (remote entities)
    - pages
        - layoyt layer (pages and widgets)
    - resources
        - strings constants and app theme
    - services
        - web coomunication and "dependency injection"(InheritedWidget)

## How to run it

    1. Open your terminal
    2. Enter the folder you desire to clone the project: `cd your_folder_path`. Ex: `cd Desktop/test``
    3. Clone the project: `git clone https://github.com/MatheusMassula/mobile-test.git`
    4. Enter the project folder: `cd mobile-test/massula_test`
    5. Start your emulator: `flutter emulators --launch your_emulator_name`
        - to see your emulators list just type: `flutter emulators`, the first column refers to the emulator's name
    6. Run the project: `flutter run`
    7. Have fun \o/

## Notes

For iOS devices the scan feature only works on real devices
## Achievements

- [] Build a simple API server that provides an endpoint which generates a random seed used to create QR code. (if you cannot build an API server, we can supply a lambda to do this for you)
- [x] [Build a simple App that can call the seed endpoint and generate a QR code based on the seed.](https://github.com/MatheusMassula/mobile-test/blob/master/massula_test/lib/services/http/qr_code_web_client.dart)
- [x] [Build a "Scan" feature that can demonstrate how it works (see the mock) and how it could be validated with another endpoint.](https://github.com/MatheusMassula/mobile-test/blob/master/massula_test/lib/pages/home.dart#L41-L52)
- [x] Be sure the app will use the below UI and will have a navigation patter present.
- [x] Write clear **documentation** on how it's designed and how to execute the code.
- [x] [Provide proper unit tests.](https://github.com/MatheusMassula/mobile-test/blob/master/massula_test/test/unit)
- [x] Write concise and clear commit messages.