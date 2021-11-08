import 'package:flutter/material.dart';

PreferredSizeWidget backAppBar(context, {required String label}) {
  return AppBar(
      title: Text(
        "$label",
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.headline1,
      ),
      centerTitle: true);
}

PreferredSizeWidget actionBackAppBar(context,
    {required String? label, required actions}) {
  return AppBar(
      title: Text(
        "$label",
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.headline1,
      ),
      centerTitle: true,
      actions: actions
  );
}
