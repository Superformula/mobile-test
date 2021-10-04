import 'package:flutter/material.dart';
import '../../../design_tokens/dimensions.dart';
import '../../../generated/l10n.dart';

class HomeActionsButton extends StatefulWidget {
  const HomeActionsButton({Key? key}) : super(key: key);

  @override
  _HomeActionsButtonState createState() => _HomeActionsButtonState();
}

class _HomeActionsButtonState extends State<HomeActionsButton> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        if (_isVisible) ..._actions,
        FloatingActionButton(
          onPressed: () {
            setState(() {
              _isVisible = !_isVisible;
            });
          },
          child: Icon(_isVisible ? Icons.close : Icons.add),
        ),
      ],
    );
  }

  Iterable<Widget> get _actions => <Widget>[
        _HomeActionItem(
          title: S.of(context).homeActionScan,
          icon: Icons.camera_alt_outlined,
          onPressed: () {},
        ),
        const SizedBox(height: Dimensions.regular),
        _HomeActionItem(
          title: S.of(context).homeActionGenerate,
          icon: Icons.qr_code,
          onPressed: () {},
        ),
        const SizedBox(height: Dimensions.regular),
      ];
}

class _HomeActionItem extends StatelessWidget {
  const _HomeActionItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: IntrinsicWidth(
        child: Row(
          children: <Widget>[
            Text(title),
            const SizedBox(width: Dimensions.xSmall),
            Icon(icon, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
