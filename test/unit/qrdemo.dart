import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:qrdemo/providers/qr_provider.dart';
import 'package:qrdemo/providers/timer_provider.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:uuid/uuid.dart';

void main() async {
  group('qr demo in testing', () {
    // Reading the documentation, firestore recommends testing using Fakes
    testWidgets('check database exists', (WidgetTester tester) async {
      final firestore = FakeFirebaseFirestore();
      final completed = firestore.collection('completed');
      await completed.add({'code': Uuid().v4(), 'time': DateTime.now()});

      await tester.pumpWidget(StreamBuilder<QuerySnapshot>(
          stream: completed.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              expect(snapshot.data!.docs.length, isNotEmpty);
              return Container();
            } else {
              return Container();
            }
          }));
    });

    testWidgets('generate code', (WidgetTester tester) async {
      await tester.pumpWidget(ChangeNotifierProvider(
          create: (context) => QRProvider(),
          lazy: false,
          builder: (context, _) {
            WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
              String code = Provider.of<QRProvider>(context, listen: false)
                  .generateCode();
              expect(code, isNotEmpty);
            });
            return Container();
          }));
    });

    testWidgets('countdown is 15 when reset', (WidgetTester tester) async {
      await tester.pumpWidget(ChangeNotifierProvider(
          create: (context) => TimerProvider(),
          builder: (context, _) {
            WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
              Provider.of<TimerProvider>(context, listen: false).reset();
              expect(
                  Provider.of<TimerProvider>(context, listen: false).countdown,
                  15);
            });
            return Container();
          }));
    });
  });
}
