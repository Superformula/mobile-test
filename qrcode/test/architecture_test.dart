import 'package:flutter/material.dart';
import 'package:qrcode/env/data_mgr.dart';
import 'package:qrcode/env/env.dart';
import 'package:qrcode/ui/qrcode_screen.dart';
import 'package:test_api/test_api.dart';
import 'package:mockito/mockito.dart';

class _MockEnv extends Mock implements Env{}
class _MockDataMgr extends Mock implements DataMgr{}

main() {

  test("test basic fetch seed with mocks", () {
    const expectedSeed = "abc123";
    Env env = _MockEnv();
    DataMgr dataMgr = _MockDataMgr();

    QRCodeScreenBloc bloc = QRCodeScreenBloc(env);

    when(env.getManager(Env.MGR_KEY_DATA)).thenReturn(dataMgr);
    when(dataMgr.fetchSeed()).thenAnswer((_) => Future.value(expectedSeed));

    Stream<String> stream = bloc.fetchSeed();
    expect(stream.map((seed) => seed), emits(expectedSeed));
  });

  test("test fetch seed, from bloc to datamgr", () {
    const expectedSeed = "bobdog was here";

    // create env and add TestDataMgr that will return seed
    Env env = Env();
    env.registerManager(Env.MGR_KEY_DATA, TestDataMgr(expectedSeed));

    QRCodeScreenBloc bloc = QRCodeScreenBloc(env);
    Stream<String> stream = bloc.fetchSeed();
    expect(stream.map((seed) => seed), emits(expectedSeed));
  });
}


class TestDataMgr extends DataMgr {
  String _seed;

  TestDataMgr(this._seed);

  @override
  Future<String> fetchSeed() => Future.value(_seed);
}