Simple QR Code generator
by: Jake Dobson

This is a simple app that requests a randomly generated seed to create a QR code. The request is called via Alamofire and its response comes back as JSON and is casted as a dictionary of Strings. I grab the seed from the dictionary by accessing its key and saving the value.

The seed value is then encoded to work nicely with the Core Image filter value, which is necessary to create the order of the blocks based on the given seed. In order to display the qr code, it needs to be converted to UIImage so the image view can handle it.

These images were coming up blurry so I found a nice way to transform the x & y scale of the image to make it appear nicely in the image view.

Lastly, I use a button to trigger the API request. If there is no image present(or QR code is cleared), the button will display "Generate", which will request seed and present a new, random QR code and change the button to red with text "CLEAR". If there is an image(successful API request and QR code presented), the button will change to red and display "CLEAR", which upon press will clear the QR code image and reset the button back to "Generate".
