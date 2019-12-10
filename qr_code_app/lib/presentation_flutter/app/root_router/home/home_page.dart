import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:qr_code_app/presentation_flutter/app/intl/app_localizations.dart';

class HomePage extends StatelessWidget {
  final Function onScan;
  final Function onQrCode;

  const HomePage({
    Key key,
    @required this.onScan,
    @required this.onQrCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      floatingActionButton: buildFloatingActionButton(context),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        AppLocalizations.of(context).title,
      ),
    );
  }

  Widget buildFloatingActionButton(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context);

    ThemeData themeData = Theme.of(context);
    Color accentColor = themeData.accentColor;
    Color accentColorIcon = themeData.accentIconTheme.color;

    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      backgroundColor: accentColor,
      animatedIconTheme: IconThemeData(
        size: themeData.accentIconTheme.size,
        color: accentColorIcon,
      ),
      children: [
        SpeedDialChild(
          child: Icon(
            Icons.image,
            color: accentColorIcon,
          ),
          onTap: onQrCode,
          backgroundColor: accentColor,
          label: appLocalizations.qrCode,
        ),
        SpeedDialChild(
          child: Icon(
            Icons.photo_camera,
            color: accentColorIcon,
          ),
          backgroundColor: accentColor,
          onTap: onScan,
          label: appLocalizations.scanner,
        )
      ],
    );
  }
}
