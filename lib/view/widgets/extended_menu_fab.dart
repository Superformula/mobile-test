import 'package:flutter/material.dart';
import 'package:superformula_test/core/resources/app_routes.dart';

class ExtendedMenuFAB extends StatefulWidget {
  const ExtendedMenuFAB({super.key});

  @override
  State<ExtendedMenuFAB> createState() => _ExtendedMenuFABState();
}

class _ExtendedMenuFABState extends State<ExtendedMenuFAB>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;
  bool openedMenu = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    animation = Tween<double>(begin: 0, end: 150).animate(controller);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void onPressFAB() {
    if (animation.value == 0) {
      controller.forward();
    } else {
      controller.reverse();
    }

    setState(() {
      openedMenu = !openedMenu;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Positioned(
          bottom: 4,
          right: 44,
          child: AnimatedBuilder(
            animation: animation,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Flexible(
                  child: VerticalDivider(
                    thickness: 2,
                    indent: 4,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: _ExtendedMenuItemFAB(
                    icon: Icons.qr_code_scanner_outlined,
                    onPressed: () =>
                        Navigator.of(context).pushNamed(AppRoutesName.scan),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: _ExtendedMenuItemFAB(
                    icon: Icons.qr_code_2_outlined,
                    onPressed: () =>
                        Navigator.of(context).pushNamed(AppRoutesName.qrcode),
                  ),
                ),
              ],
            ),
            builder: (context, child) => SizedBox(
              height: 46,
              width: animation.value,
              child: child!,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: AnimatedRotation(
            duration: const Duration(milliseconds: 500),
            turns: openedMenu ? 0.5 : 1,
            child: FloatingActionButton(
              onPressed: onPressFAB,
              child: const Icon(
                Icons.menu_open_rounded,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ExtendedMenuItemFAB extends StatelessWidget {
  const _ExtendedMenuItemFAB({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
      ),
      child: Center(child: Icon(icon)),
    );
  }
}
