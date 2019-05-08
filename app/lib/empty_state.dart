import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  EmptyState({Key key, this.icon, this.title, this.description})
      : super(key: key);

  final String title;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              icon,
              size: 50.0,
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              description,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
