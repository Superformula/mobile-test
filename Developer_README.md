# QRSample

This is a QR Sample application that demonstrates: 
1) the developer understand iPhone Development process
2) the developer understands Web services
3) how deep the developer understand algorithms and data structures

## Prerequisites

Ensure that the latest version of the [homebrew](https://brew.sh) is on your machine or equivalent.

## Getting Started

Run the following command to pull down the repository to the desired folder location:

```
git clone https://github.com/hireljc/mobile-test.git
```

## Running Project

1) Sever-QRSample
After pulling the repository, run the following command within the directory Sever-QRSample:

```
brew install python3
pip3 install flask
pip3 install randomwordgenerator
python3 app.py
````
Then visit localhost:5000/ in your browser for QR code
Then visit localhost:5000/seed in your browser for the json the app consumes.

2) iOS-QRSample
Then run the following command within the directory iOS-QRSample:
```
pod install
```
Then open the QRSample.xcworkspace, and press the play icon at the top left of Xcode (make sure to choose your iPhone; otherwise, you will not be able to use the scan feature of the application)

## Running XCTests and/or XCUITests Locally

* To run both XCTests and XCUITests simultaneously, long press and hold the Run button until a drop down menu appears, then select the Test option.
* To run only XCTests or XCUITests by themselves, navigate to the Test Navigator area of Xcode, then select the Play Button next to either the `QRSampleTests` or `QRSampleITests` suites.
* To run tests individually this can be done from the Test Navigator area or within the specific test file itself.

NOTE: We utilize OHHTTPStubs for mocking network connections, responses, etc. In addition, we make use of dependency injection to make our code more testable.

## Deployment

For deployment, I would use jenkins or fastlane.

## Developer comments

Great simple project. 
1)For the Server-QRSample, I know that I could have went a lot more in depth in terms of "randomizing" the seed, using some simple web crawling method.
2)For the iOS-QRSample, I like to use nameVC.swift instead of nameViewController.swift for the classes simply because they are smaller; I know most devs/companies/tech studios do not allow this - no biggie. 
2)For the iOS-QRSample, I use storyboard for each VC to avoid conflicts, and wrap each VC in a Nav Controller with identifers, just in case of future use. I think this way is simple than nibs or even programmatically. 

## Final comments
Thank you for this opportunity! Any feedback would be greatly appreciated. 



