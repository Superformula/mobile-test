# mobile-test
# This project will allow you to generate a seed and have that seed converted to a QRCode.
Which later can be used to validate the user

## Start API server
STEP1. 
- To start API server, 
1. go into API dir and run the following commands
2. run 'npm install'
3. run 'npm start' 

## Generate QrCode.
Step 2. 
1. On the home screen, click the Floating Action Button then the 'QrCode' button from the expended list 
2. Now you have successfully generated a code and have 15seconds to validate a code.

### Validation (Scan)
Step 3. 
1. On home screen, click the Floating Action Button then the 'Scan' button from the expended list 
2. Now you have 3 options to choose from, 
I. Simply scan a QR code with your camera
II. Click on Scan from Gallery Image
III. You can Validate with recent Generated Code, which will auto fetch the code and validate you if the QrCode time (15sec) hasn't expired. 


