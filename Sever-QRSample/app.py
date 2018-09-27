from flask import Flask, render_template
from data import sampleJson
from qrcode.image.pure import PymagingImage
import qrcode.image.svg
from pathlib import Path
import qrcode
import base64
import os.path
import pyqrcode
import os
import png 
import json
from flask import Response
import random


app = Flask(__name__)
app.debug = True
#app.add_url_rule('/',
#                 view_func=Main.as_view('main'),
#                 methods = ['GET'])
#
#app.add_url_rule('/seed/',
#                 view_func=Main.as_view('page')
sampleJson = sampleJson()

@app.route("/")
def index():
    
#    return json.dumps(sampleJson)
    path = str(os.getcwd()) +"/qrcode.svg"
    path = str(os.getcwd()) +"/code.png"
    #    if method == 'basic':
    factory = qrcode.image.svg.SvgImage
        #    elif method == 'fragment':
#        factory = qrcode.image.svg.SvgFragmentImage
#    else:
#        factory = qrcode.image.svg.SvgPathImage


#    qr = qrcode.QRCode(
#        version=1,
#        error_correction=qrcode.constants.ERROR_CORRECT_L,
#        box_size=10,
#        border=4,
#    )
#    qr.add_data("")
#    qr.make(fit=True)
#
##    img = qrcode.make("https://www.linkedin.com/in/ljcaaddfiir/", image_factory=PymagingImage)
#    img = qr.make_image(fill_color="black", back_color="white")

#    img = qrcode.make('Some data here', image_factory=factory)
#    big_code = pyqrcode.create('0987654321', error='L', version=27, mode='binary')
#    big_code.png('code.png', scale=6, module_color=[0, 0, 0, 128], background=[0xff, 0xff, 0xcc])
#
#    url = pyqrcode.create('https://www.linkedin.com/in/ljcaaddfiir/')
#    url.svg('qrcode.svg', scale=8)
#    print(url.terminal(quiet_zone=1))
#    file1 = open(path, "w")
#    toFile = input(url.terminal(quiet_zone=1))
#    file1.write(toFile)
#    file1.close()
#    img.save_to_path(path)

#
#    img_file = open(path,'w')
#    img_file.write(img)
#    data_uri = base64.b64encode(open(path, 'rb').read()).decode('utf-8').replace('\n', '')
#    return render_template("index.html", url = path)
    return render_template("index.html")

@app.route("/seed")
def seed():
    random_seed = random.randint(1,21)
    value = str(random_seed)
    ret = json.dumps({'seed': value})
    resp = Response(response=ret,
                    status=200,
                    mimetype="application/json")
    return resp
    
if __name__ == "__main__":
    app.run(debug=True)
