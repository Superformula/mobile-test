# SuperCode

A flutter app that generates and validates QR Codes

## Running the app

### Prerequisites
- Flutter SDK is installed (version `1.5.4-hotfix.2` was from the `stable` channel was used to develop this application). 
See https://flutter.dev/docs/get-started/install.
- The server is running (see [server readme](../server/README.md))
- The address of the server is correct in [main.dart](lib/main.dart), line 27
    - `http://localhost:3000` if you are running the application on a simulator
    - `http://<your_computers_ip>:3000` if you are running the application on a real device    

### Instructions
- All commands are run from the `app/` directory
1. Run `flutter packages get`
2. Run `flutter devices` which will yield an output like so:
    ```
    iPhone Xs • D5BC90F2-B17F-42A0-86F8-7015DDA7FEC0 • ios
    ```
3. Run `flutter run -d <device_id>` where `device_id` is the alpha-numeric value output from the previous command

### Development
- This application uses [built_value](https://github.com/google/built_value.dart) for immutable state which requires code to be generated
- To generate the code run `flutter packages pub run build_runner <watch|build>` from the `app/` directory when making changes 
to [app_state.dart](lib/redux/app_state.dart)

### Troubleshooting
- Ensure that the address of the server is pointing to the right host, see `Prerequisites`
- If running on a real device, ensure your computer and device are on the same
network

## Testing
- To run the unit tests, run `flutter test`
- Test QR Codes are in the [test_codes](../test_codes) directory which can be used to test
Scan feature of the application.
