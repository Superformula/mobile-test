import 'package:flutter/material.dart';
import 'package:qr_generator/index/action-button.dart';
import 'package:qr_generator/index/expandable-fab.dart';
import 'package:qr_generator/index/index-bloc.dart';
import 'package:qr_generator/providers/bloc-provider.dart';

class IndexScreen extends StatefulWidget {
  IndexScreen({ Key? key }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {

  late IndexBloc bloc;
  static const double _FAB_EXPANSION_HEIGHT = 75;

  @override
  void initState() {
    super.initState();

    bloc = BlocProvider.maybeOf<IndexBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Generator"),
      ),
      body: Container(
        child: GestureDetector(
          onTap: () => bloc.setFabExpansion(false),
        ),
      ),
      floatingActionButton: StreamBuilder<bool>(
        stream: bloc.fabExpansionStream,
        initialData: false,
        builder: (context, snapshot) {
          return ExpandableFab(
            children: [
              ActionButton(
                icon: Icon(Icons.camera_alt_outlined),
                label: "Scan code",
                onPressed: () {
                  bloc.setFabExpansion(false);
                },
              ),
              ActionButton(
                icon: Icon(Icons.refresh),
                label: "Generate code",
                onPressed: () {
                  Navigator.of(context).pushNamed("/qr-generation");
                  bloc.setFabExpansion(false);
                },
              )
            ],
            distance: _FAB_EXPANSION_HEIGHT,
            isExpanded: snapshot.data!,
            onTap: bloc.setFabExpansion,
            expansionChangeListenable: bloc.fabExpansionStream,
          );
        }
      )
    );
  }
}