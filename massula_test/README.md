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

    1. Download the source code
    2. Open the downlaoded code on VS Code
    3. Make sure you have the flutter extension installed in your VS Code
    4. Press on keyboad `cmd + shift + p` (this should open the command palette)
    5. Search for `Flutter: Get Packages` and click on it
    6. Press on keyboard 'ctrl + ,' (this should open a search files bar)
    7. Type `main` on search bar
    8. Open an iOS or Android Emulator
    9. Press on keyboard `ctrl + f5` to run the app

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