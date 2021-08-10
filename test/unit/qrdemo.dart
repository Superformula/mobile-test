import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:qrdemo/providers/timer_provider.dart';

void main() async {
  group('qr demo in testing', () {
    testWidgets('check database exists', (WidgetTester tester) async {
      await Firebase.initializeApp();
      final snapshot =
          FirebaseFirestore.instance.collection('completed').snapshots();
      expect(snapshot.length, isNotEmpty);
    });

    testWidgets('timer started', (WidgetTester tester) async {
      await tester.pumpWidget(TimerExample());
    });
  });
}

class TimerExample extends StatefulWidget {
  const TimerExample({Key? key}) : super(key: key);

  @override
  _TimerExampleState createState() => _TimerExampleState();
}

class _TimerExampleState extends State<TimerExample> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
        future: Provider.of<TimerProvider>(context, listen: false).startClock(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Scaffold(
                body: Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            case ConnectionState.done:
              return Scaffold(
                body: Container(
                  child: Center(),
                ),
              );
          }
        });
  }
}
