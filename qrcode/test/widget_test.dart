import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:qrcode/core/bloc.dart';
import 'package:qrcode/env/data_mgr.dart';
import 'package:qrcode/env/env.dart';
import 'package:qrcode/model/model.dart';
import 'package:qrcode/ui/qrcode_screen.dart';

class _MockEnv extends Mock implements Env{}
class _MockDataMgr extends Mock implements DataMgr{}

main() {

  testWidgets('ensure architecture can support ui testing', (WidgetTester tester) async {

    Env env = _MockEnv();
    DataMgr dataMgr = _MockDataMgr();

    when(env.getManager(Env.MGR_KEY_DATA)).thenReturn(dataMgr);
    when(dataMgr.fetchSeed()).thenAnswer((_) => Future.value(Seed.success("aaa 111", 0)));

    await tester.pumpWidget(
        new MaterialApp(
          home: Container(
            child: BlocProvider<QRCodeScreenBloc>(bloc: QRCodeScreenBloc(env), child: TestQRCodeScreen()),
          ),
        )
    );
    await tester.pump(Duration.zero);

    expect(find.text('aaa 111'), findsOneWidget);
  });
}

///
/// Change QRCodeScreen to show seed value instead of QRCode image
class TestQRCodeScreen extends QRCodeScreen {
  @override
  Widget getSeedDisplayWidget(String seed) => Text(seed);
}