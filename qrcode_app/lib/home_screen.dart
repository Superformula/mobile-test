import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrcode_app/expandable_fab.dart';
import 'package:qrcode_app/presentation/seed_presenter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.presenter}) : super(key: key);
  final SeedPresenter presenter;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            StreamBuilder<PresenterState>(
                stream: widget.presenter.streamData,
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Container();
                  else if (snapshot.data is LoadingState)
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  else if (snapshot.data is FailureState)
                    return Container(
                      child: Text('Error'),
                    );
                  else
                    return CustomPaint(
                      size: Size.square(200),
                      painter: QrPainter(
                        data: snapshot.data!.seed.seed,
                        version: QrVersions.auto,
                        eyeStyle: const QrEyeStyle(
                          eyeShape: QrEyeShape.square,
                          color: Color(0xff128760),
                        ),
                        dataModuleStyle: const QrDataModuleStyle(
                          dataModuleShape: QrDataModuleShape.circle,
                          color: Color(0xff1a5441),
                        ),
                        // size: 320.0,
                        // embeddedImage: snapshot.data,
                        // embeddedImageStyle: QrEmbeddedImageStyle(
                        //   size: Size.square(60),
                        // ),
                      ),
                    );
                }),
            StreamBuilder<int>(
                stream: widget.presenter.expirationData,
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Container(
                      child: Text(''),
                    );
                  else {
                    if (snapshot.data == 0) widget.presenter.getData();
                    return Text(snapshot.data.toString());
                  }
                }),
          ],
        ),
      ),
      floatingActionButton: ExpandableFab(
        distance: 80.0,
        children: [
          ActionButton(
            onPressed: () => widget.presenter.getData(),
            icon: const Icon(Icons.format_size),
            label: 'Scan',
          ),
          ActionButton(
            onPressed: () => _showAction(context, 1),
            icon: const Icon(Icons.insert_photo),
            label: 'Code',
          ),
        ],
      ),
    );
  }

  void _showAction(BuildContext context, int index) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text('Fernanda'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('CLOSE'),
            ),
          ],
        );
      },
    );
  }
}
