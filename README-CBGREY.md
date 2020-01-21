

# Superformula Test Project
Coding test results for Chris Grey (chris@wingtip.dev)

This project includes two components: 

## sftest_flutter
Standard flutter app with 3 screens per the design spec: 
1) Main screen. 
2) QR View
3) QR Scanning

Scanning is functional if run on actual hardware. 

### Testing
There are some basic unit tests and UI tests included. They are certainly not comprehensive but are included to be illustrative. 
> flutter test test/widget_test.dart

> flutter test test/qrdata_test.dart

## sftest_server
This is a simple API server written in Aqueduct (https://aqueduct.io/) to make an end-to-end Dart-based solution. Running it just requires a standard Dart installation then start it with:
> aqueduct serve

This will run a simple server on port :5555. 



