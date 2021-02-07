import 'package:qr_app/models/seed_data.dart';

final _data = [
  '39393993393',
  '3726626262262',
  'test data1',
  'test data2',
  'test data3',
  '39393939933',
  '4i4i4ii4444',
  'test data 4',
  'test data 5',
  'test data 6'
];

class MockDataGenerator {
  static final MockDataGenerator _singleton = MockDataGenerator._internal();

  factory MockDataGenerator() {
    return _singleton;
  }

  MockDataGenerator._internal();

  int _index = 0;

  Future<SeedData> next() async {
    await Future.delayed(Duration(seconds: 1));
    if (_index == _data.length - 1) _index = 0;
    return SeedData(
      seed: _data[_index++],
      dateTime: DateTime.now()
          .add(
            Duration(seconds: 10),
          )
          .toIso8601String(),
    );
  }
}
