import 'dart:convert';
import 'dart:io';

/// A simple CLI client to test the server.
String _host = 'localhost';
String path = '/seed';

Future main() async {
  final request = await HttpClient().get(_host, 8000, path);
  final response = await request.close();
  await utf8.decoder.bind(response).forEach(print);
}