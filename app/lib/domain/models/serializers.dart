import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:qrgenerator/domain/models/seed.dart';

part 'serializers.g.dart';

@SerializersFor([
  Seed,
])
final Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
