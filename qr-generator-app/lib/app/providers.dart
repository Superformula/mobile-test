import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_generator_app/network/api.dart';

final apiProvider = Provider((_) => Api());
