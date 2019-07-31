import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrgenerator/app/intl/app_strings.dart';
import 'package:qrgenerator/app/ui/widgets/pages.dart';
import 'package:qrgenerator/domain/blocs/seed_bloc.dart';
import 'package:qrgenerator/domain/models/seed.dart';

Widget buildGeneratePage() {
  return Provider(
    builder: (_) => SeedBloc(),
    dispose: (_, bloc) => bloc.dispose(),
    child: GeneratePage(),
  );
}

class GeneratePage extends StatelessPage {
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
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildImage(context),
          _buildTimeInfo(context),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    final bloc = Provider.of<SeedBloc>(context);
    final strings = AppStrings.of(context);
    final media = MediaQuery.of(context);
    final theme = Theme.of(context).textTheme;
    return StreamBuilder(
      stream: bloc.seed,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Seed seed = snapshot.data;
          return Center(child: QrImage(data: seed.value, size: media.size.width * 0.8));
        } else if (snapshot.hasError) {
          return Center(child: Text(strings.generateError, style: theme.body2));
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          );
        }
      },
    );
  }

  Widget _buildTimeInfo(BuildContext context) {
    final bloc = Provider.of<SeedBloc>(context);
    TextTheme textTheme = Theme.of(context).textTheme;
    return StreamBuilder(
      stream: bloc.countDown,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text("${snapshot.data}s", style: textTheme.display1);
        }
        return Text("", style: textTheme.display1);
      },
    );
  }
}
