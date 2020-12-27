import 'dart:convert';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:superformula_challenge/repositories/repositories.dart';

class MockAdapter extends HttpClientAdapter {
  bool timeout;
  bool error;

  MockAdapter({
    this.timeout = false,
    this.error = false,
  });

  DefaultHttpClientAdapter _adapter = DefaultHttpClientAdapter();

  final ResponseBody seedResponse = ResponseBody.fromString(
    jsonEncode(
      {
        "_id": '24bc3',
        "seed": "foo",
        "expires_at": "2020-12-26T20:14:47.410Z",
      },
    ),
    200,
  );

  @override
  Future<ResponseBody> fetch(RequestOptions options,
      Stream<List<int>> requestStream, Future cancelFuture) async {
    // Timeout
    if (timeout) {
      await Future.delayed(
          Duration(milliseconds: QrRepository.timeoutMs + 100));
    }
    if (error) {
      return ResponseBody.fromString('{}', 400);
    }

    // Success responses
    String url = options.uri.toString();
    if (url.contains(QrRepository.seedEndpoint)) {
      return seedResponse;
    }
    return ResponseBody.fromString('{}', 200);
  }

  @override
  void close({bool force = false}) {
    _adapter.close(force: force);
  }
}
