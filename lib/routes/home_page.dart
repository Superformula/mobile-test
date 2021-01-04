import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_test/blocs/slider/bloc/slider_bloc.dart';
import 'package:qr_code_test/blocs/slider/bloc/slider_event.dart';
import 'package:qr_code_test/routes/home_page/home_body.dart';

/// The home page of the app shows a FAB which toggles a sliding menu, defined
/// in the [HomeBody] widget.
class HomePage extends StatelessWidget {
  const HomePage();

  /// Opens or closes the menu
  void _openMenu(BuildContext context) =>
      context.read<SliderBloc>().add(const ToggleSlider());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // The sliding menu
          BlocBuilder<SliderBloc, double>(
            builder: (context, state) => AnimatedPositioned(
              child: const HomeBody(),
              duration: const Duration(milliseconds: 200),
              right: state,
              bottom: 86,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: BlocBuilder<SliderBloc, double>(
          builder: (context, state) {
            // If 'state' is negative, then the menu is hidden and thus the '+'
            // icon should appear to indicate that the menu can be opened-
            if (state < 0) {
              return const Icon(Icons.add);
            }
            return const Icon(Icons.remove);
          },
        ),
        onPressed: () => _openMenu(context),
      ),
    );
  }
}