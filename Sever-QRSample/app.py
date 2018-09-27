from flask import Flask, render_template
import urllib.request as urllib2
from flask import Response
import randomwordgenerator
import primary
import backup
import socket
import json
import os


app = Flask(__name__)
app.debug = True

# return index.html with QR Code for testing client
@app.route("/")
def index():
    return render_template("index.html")

# return random seed to generate QR Code on Client.
@app.route("/seed")
def seed():
    num_words = 1
    words = generate_random_words(n = num_words)
    ret = json.dumps({'seed': "https://www.google.com/search?q=" + words[0]})
    return Response(response=ret,
                    status=200,
                    mimetype="application/json")

def generate_random_words(n = 1):
	results = []
	try:
		# Primary generation method - Load dictionary from website, and select
		# n random words from that collection.
		results = primary.get_n_random_words(n)
	except:
		# If unable to read website, then generate n random strings.
		results = backup.get_n_random_words(n)
	return results if not results or len(results) > 1 else results

if __name__ == "__main__":
    app.run()