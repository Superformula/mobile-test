import 'package:flutter/material.dart';
import 'package:qrgenerator/app/intl/app_strings.dart';
import 'package:qrgenerator/app/ui/widgets/pages.dart';

Widget buildGeneratePage() {
  return GeneratePage();
}

class GeneratePage extends StatefulPage {
  @override
  State<StatefulWidget> createState() => _GeneratePageState();
}

class _GeneratePageState extends PageState<GeneratePage> with SingleTickerProviderStateMixin {
  @override
  Widget buildAppBar(BuildContext context) {
    final strings = AppStrings.of(context);
    return AppBar(
      title: Text(strings.generateTitle),
      centerTitle: true,
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Container();
  }
}
