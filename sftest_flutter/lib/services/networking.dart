import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;


  Future getQRData() async {
    // Gets updated QR data from the server and returns a Map Future
    // This would be a more useful class in a larger solution that required authentication etc. 
    
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      throw("Unable to get QR data from server.");
    }
  }
}