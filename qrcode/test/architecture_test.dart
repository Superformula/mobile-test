import 'package:flutter/material.dart';
import 'package:qrcode/env/backend_mgr.dart';
import 'package:qrcode/env/data_mgr.dart';
import 'package:qrcode/env/env.dart';
import 'package:qrcode/env/localstorage_mgr.dart';
import 'package:qrcode/main.dart';
import 'package:qrcode/model/model.dart';
import 'package:qrcode/ui/qrcode_screen.dart';
import 'package:test_api/test_api.dart';
import 'package:mockito/mockito.dart';

class _MockEnv extends Mock implements Env{}
class _MockDataMgr extends Mock implements DataMgr{}
class _MockBackendMgr extends Mock implements BackendMgr{}
class _MockLocalStorageMgr extends Mock implements LocalStorageMgr{}

main() {

  test("test basic fetch seed with mocks", () {
    Seed expectedSeed = Seed.success("abc123", 123456);
    Env env = _MockEnv();
    DataMgr dataMgr = _MockDataMgr();

    QRCodeScreenBloc bloc = QRCodeScreenBloc(env);

    when(env.getManager(Env.MGR_KEY_DATA)).thenReturn(dataMgr);
    when(dataMgr.fetchSeed()).thenAnswer((_) => Future.value(expectedSeed));

    Stream<Seed> stream = bloc.fetchSeed();
    expect(stream.map((seed) => seed), emits(expectedSeed));
  });

  test("test fetch seed, from bloc to datamgr", () {
    Seed expectedSeed = Seed.success("bobdog was here", 123456);

    // create env and add TestDataMgr that will return seed
    Env env = Env();
    env.registerManager(Env.MGR_KEY_DATA, TestDataMgr(expectedSeed));

    QRCodeScreenBloc bloc = QRCodeScreenBloc(env);
    Stream<Seed> stream = bloc.fetchSeed();
    expect(stream.map((seed) => seed), emits(expectedSeed));
  });
  
  test("test seed fetched from local cache if not connected", () async {
    Env env = _MockEnv();
    DataMgr dataMgr = DefaultDataMgr();
    BackendMgr backendMgr = _MockBackendMgr();
    LocalStorageMgr localStorageMgr = _MockLocalStorageMgr();

    App.setEnv(env);

    when(env.getManager(Env.MGR_KEY_BACKEND_MGR)).thenReturn(backendMgr);
    when(backendMgr.isConnected()).thenAnswer((_) => Future.value(false));
    when(env.getManager(Env.MGR_KEY_LOCAL_STORAGE)).thenReturn(localStorageMgr);
    when(localStorageMgr.fetchLatestSeed()).thenAnswer((_) => Future.value(Seed.success("abc123", 123456)));

    Seed seed = await dataMgr.fetchSeed();
    expect(seed.success, true);
    expect(seed.seed, "abc123");
    expect(seed.expiresAt, 123456);
  });
}


class TestDataMgr extends DataMgr {
  Seed _seed;

  TestDataMgr(this._seed);

  @override
  Future<Seed> fetchSeed() => Future.value(_seed);
}