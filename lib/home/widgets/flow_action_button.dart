import 'package:flutter/material.dart';
import 'package:qr_code/home/widgets/flow_action_button_delegate.dart';

class FlowActionButton extends StatefulWidget {
  const FlowActionButton({super.key});

  @override
  State<FlowActionButton> createState() => _FlowActionButtonState();
}

class _FlowActionButtonState extends State<FlowActionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController animation;
  final isMenuOpened = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  void toogleMenu() {
    isMenuOpened.value ? animation.reverse() : animation.forward();
    isMenuOpened.value = !isMenuOpened.value;
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
      clipBehavior: Clip.none,
      delegate: FlowActionButtonDelegate(animation: animation),
      children: [
        FloatingActionButton(
          onPressed: toogleMenu,
          child: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: animation,
          ),
        ),
        FloatingActionButton(
          child: const Icon(Icons.qr_code_scanner),
          onPressed: () {},
        ),
        FloatingActionButton(
          child: const Icon(Icons.qr_code_2),
          onPressed: () {},
        ),
      ],
    );
  }
}
