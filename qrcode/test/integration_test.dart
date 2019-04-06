import 'package:qrcode/env/data_mgr.dart';
import 'package:qrcode/env/env.dart';
import 'package:qrcode/ui/qrcode_screen.dart';
import 'package:test_api/test_api.dart';
import 'package:mockito/mockito.dart';

class _MockEnv extends Mock implements Env{}
class _MockDataMgr extends Mock implements DataMgr {}

main() {

  test("fetch seed", () {
    Env env = _MockEnv();
    DataMgr dataMgr = _MockDataMgr();

    QRCodeScreenBloc bloc = QRCodeScreenBloc(env);

    when(env.getManager(Env.DATA_MGR_KEY)).thenReturn(dataMgr);
    when(dataMgr.fetchSeed()).thenAnswer((_) => Future.value("abc123"));

    Stream<String> stream = bloc.fetchSeed();
    expect(stream.map((seed) => seed), emits("abc123"));
  });
}
