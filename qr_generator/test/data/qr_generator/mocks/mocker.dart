import 'package:mockito/annotations.dart';
import 'package:qr_generator/data/api/api.dart';

@GenerateMocks([QrApi])
void main() {}

Map<String, String> mockQRValidResponse = {
  "seed": "someSeed",
  "expiresAt": "1979-11-12T13:10:42.24Z"
};
