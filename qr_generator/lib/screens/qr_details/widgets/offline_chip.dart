import 'package:flutter/material.dart';

class OfflineChip extends StatelessWidget {
  final bool offline;
  const OfflineChip({Key? key, this.offline = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: offline,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Chip(
          backgroundColor: Colors.white,
          avatar: Icon(
            Icons.offline_pin,
            color: Colors.purple,
          ),
          label: Text(
            'Offline',
            style: TextStyle(color: Colors.purple),
          ),
        ),
      ),
    );
  }
}
