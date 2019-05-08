import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:supercode/empty_state.dart';
import 'package:supercode/models.dart';

class Home extends StatefulWidget {
  final bool loading;
  final Seed activeSeed;
  final Function() fetchQRCode;

  const Home({
    Key key,
    this.activeSeed,
    this.loading,
    this.fetchQRCode,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget _buildEmptyState() {
    return EmptyState(
      icon: Icons.pages,
      title: 'No QR Code',
      description: 'Tap the + to generate a QR Code',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Supercode'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              height: 200,
              width: 200,
              child: widget.loading
                  ? CircularProgressIndicator()
                  : widget.activeSeed != null
                      ? QrImage(
                          data: '${widget.activeSeed.seed}',
                        )
                      : _buildEmptyState(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          widget.fetchQRCode();
        },
      ),
    );
  }
}
