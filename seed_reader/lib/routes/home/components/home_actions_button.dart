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
          onPressed: () => Navigator.of(context).pushNamed('/scan'),
        ),
        const SizedBox(height: Dimensions.regular),
        _HomeActionItem(
          title: S.of(context).homeActionGenerate,
          icon: Icons.qr_code,
          onPressed: () => Navigator.of(context).pushNamed('/generate_seed'),
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
            Text(title, style: Theme.of(context).textTheme.button),
            const SizedBox(width: Dimensions.small),
            Container(
              padding: const EdgeInsets.all(Dimensions.small),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor,
              ),
              child: Icon(icon, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
