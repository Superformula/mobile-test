from flask import Flask, render_template
import json
from flask import Response
import random

app = Flask(__name__)
app.debug = True

# return index.html with QR Code for testing client
@app.route("/")
def index():
    return render_template("index.html")

# return random seed to generate QR Code on Client.
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
    app.run()
