import 'dart:async';
import 'package:flutter/material.dart';
import 'package:generator/http/RequestFile.dart';
import 'package:generator/widgets/appbar.dart';
import 'package:qr_flutter/qr_flutter.dart';

HttpProvider _httpProvider = HttpProvider();

class GeneratePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GeneratePageState();
}

class GeneratePageState extends State<GeneratePage> {
  bool countDown = true;

  void initState() {
    super.initState();
    getData();
  }

  String _data = "";

  late Timer _timer;
  int _start = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: backAppBar(context, label: 'QR CODE'),
        body: SafeArea(
          child: countDown
              ? Center(child: CircularProgressIndicator())
              : qrMethod(),
        ));
  }

  Widget qrMethod() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            QrImage(
              data: _data,
              version: QrVersions.auto,
              size: MediaQuery.of(context).size.width * .50,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .10,
            ),
            Text('$_start seconds',
                style: Theme.of(context).textTheme.bodyText1)
          ],
        ),
      );

  getData() async {
    try {
      setState(() {
        countDown = true;
      });
      var queryData = await _httpProvider.fetchData();
      if (queryData == null) {
        return;
      }
      _data = queryData.name;
      startTimer();
      setState(() {
        countDown = false;
      });
    } catch (e) {
      print(e);
    }
  }

  void reset() {
    setState(() {
      _timer.cancel();
      _start = 15;
    });
  }

  startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          getData();
          reset();
          setState(() {
            countDown = false;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}
