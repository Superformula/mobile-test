import 'package:flutter/material.dart';
import 'package:qr_generator/providers/bloc-provider.dart';
import 'package:qr_generator/qr-generation/qr-generation-bloc.dart';

class QRGenerationScreen extends StatefulWidget {
  const QRGenerationScreen({ Key? key }) : super(key: key);

  @override
  _QRGenerationScreenState createState() => _QRGenerationScreenState();
}

class _QRGenerationScreenState extends State<QRGenerationScreen> {

  late QRGenerationBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.maybeOf<QRGenerationBloc>(context);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your code"),
      ),
      body: Container(),
    );
  }
}