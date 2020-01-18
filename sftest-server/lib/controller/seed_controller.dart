import 'package:aqueduct/aqueduct.dart';
import 'package:sftest/sftest.dart';
import 'package:random_string/random_string.dart';

class SeedController extends Controller {

  @override
  Future<RequestOrResponse> handle(Request request) async {
    var now = DateTime.now().add(Duration(minutes:1)).toIso8601String();

    final _json ={
      'seed': randomString(32),
      'expires_at': now};
    return Response.ok(_json);
  }
}
