from flask import Flask, render_template
import urllib.request as urllib2
from flask import Response
from socket import timeout
import threading
import random
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
    random_seed = random.randint(1,21)
    value = str(random_seed)

#    while(True):
#        ip0 = str(random.randint(0, 255))
#        ip1 = str(random.randint(0, 255))
#        ip2 = str(random.randint(0, 255))
#        ip3 = str(random.randint(0, 255))
#        url = 'http://' + ip0 + '.' + ip1 + '.'+ ip2 + '.'+ ip3
#        print(url)
#        
#        if is_valid_ipv4_address(url) or is_valid_ipv6_address(url):
#            print("valid")
#            break
#        else:
#            print("not valid")
#        try:
#            response = urllib.request.urlopen(url, timeout=5).read().decode('utf-8')
#            if urlContent.find('<DOCTYP') > -1 or urlContent.find('<html') > -1 or urlContent.find('<HTML') > -1:
#          
#            else:
#                logging.info('Access successful.')
#        except:
#            pass
#                
#        try:
#            urlContent = urllib2.urlopen(url).read()
#            if urlContent.find('<DOCTYP') > -1 or urlContent.find('<html') > -1 or urlContent.find('<HTML') > -1 or:
#                break
#        except:
#            pass
#    print("Found URL: " + url)
#    os.system('start ' + url)
    num_words = 1
    words = generate_random_words(n = num_words)
    print(words)
#    ret = json.dumps({'seed': value})
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

def is_valid_ipv4_address(address):
    try:
        socket.inet_pton(socket.AF_INET, address)
    except AttributeError:  # no inet_pton here, sorry
        try:
            socket.inet_aton(address)
        except socket.error:
            return False
        return address.count('.') == 3
    except socket.error:  # not a valid address
        return False

    return True

def is_valid_ipv6_address(address):
    try:
        socket.inet_pton(socket.AF_INET6, address)
    except socket.error:  # not a valid address
        return False
    return True

if __name__ == "__main__":
    app.run()