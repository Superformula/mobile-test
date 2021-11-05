import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scan/scan.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class ScanScreen extends StatefulWidget {
  dynamic data;
  ScanScreen({Key? key, required this.data}) : super(key: key);
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  ScanController controller = ScanController();
  late int _nowTime;
  final DateTime _now = DateTime.now();

  Future<void> _showAlert(String title, String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Called upon scan of QrCode from the 3 options
  validate(String deviceId, String seed) async {
    final url = Uri.parse('http://localhost:8080/user_val').replace(queryParameters: {'id': deviceId, 'seed': seed});
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> res = jsonDecode(response.body);
      if (res['valid'] == 'valid') {
        _showAlert('Validation', 'Successfully validated');
      } else {
        _showAlert('Validation', 'Validation failed');
      }
    } else {
      _showAlert('Validation', 'Validation failed');
      throw Exception('Failed to generate the code');
    }
  }
// allows user to scan from gallery
  onPhotoGalary(deviceId) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: const Text('Scan'),
          message: const Text('Please select QrCode Image'),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: const Text('Gallery'),
              onPressed: () async {
                var _picker = ImagePicker();
                final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                String? str = await Scan.parse(image!.path);
                if (str != null) {
                  validate(deviceId, str);
                }
                Navigator.of(context).pop();
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            isDefaultAction: true,
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
  }

  inits() {
    _nowTime = (_now.millisecondsSinceEpoch / 1000).floor();
  }

  @override
  void initState() {
    inits();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dynamic userval = widget.data;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan'),
        backgroundColor: Colors.deepPurple[300],
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .10,
          ),
          Center(
            child: SizedBox(
              width: 250, // custom wrap size
              height: 250,
              child: ScanView(
                controller: controller,
                scanAreaScale: .7,
                scanLineColor: Colors.green.shade400,
                onCapture: (data) async {
                  validate(widget.data['deviceId'], data);
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextButton(
            child: Text("Scan Gallery Image",
                style: TextStyle(
                  color: Colors.deepPurple[300],
                  fontSize: 16,
                )),
            onPressed: () async {
              onPhotoGalary(userval.deviceId);
            },
          ),
          userval != null && _nowTime <= (userval.time + 15)
              ? TextButton(
                  child: Text(
                    "Validate with recent generated seed",
                    style: TextStyle(
                      color: Colors.deepPurple[300],
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () async {
                    if (_nowTime <= (userval.time + 15)) {
                      validate(userval.deviceId, userval.seed);
                    } else {
                      _showAlert('Validation', 'Seed time expired, try again!');
                    }
                  },
                )
              : const SizedBox(
                  height: 1,
                )
        ],
      ),
    );
  }
}
