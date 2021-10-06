import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../generated/l10n.dart';
import '../../components/countdown_timer.dart';
import '../../design_tokens/dimensions.dart';
import '../../errors.dart';
import '../../models/seed.dart';
import '../../routes/generate_seed/generate_seed_page_bloc.dart';

class GenerateSeedPage extends StatelessWidget {
  const GenerateSeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).generateSeedPageTitle),
      ),
      body: Consumer<GenerateSeedPageBloc>(
        builder: (_, GenerateSeedPageBloc bloc, __) {
          return StreamBuilder<Seed?>(
            stream: bloc.observeSeed(),
            builder: (_, AsyncSnapshot<Seed?> snapshot) {
              if (snapshot.hasData) {
                return _SuccessStateView(seed: snapshot.data!, bloc: bloc);
              }
              if (snapshot.hasError) {
                return _ErrorStateView(
                  bloc: bloc,
                  error: snapshot.error,
                );
              }
              return const _LoadingStateView();
            },
          );
        },
      ),
    );
  }
}

class _ErrorStateView extends StatelessWidget {
  const _ErrorStateView({
    Key? key,
    required this.bloc,
    required this.error,
  }) : super(key: key);

  final GenerateSeedPageBloc bloc;
  final dynamic error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            error is NotConnectedToFetchError
                ? S.of(context).generateSeedErrorNotConnected
                : S.of(context).generateSeedErrorMessage,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(height: Dimensions.regular),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                S.of(context).generateSeedErrorTryAgain,
                style: Theme.of(context).textTheme.caption,
              ),
              const SizedBox(width: Dimensions.xSmall),
              CountDownTimer(
                key: UniqueKey(),
                duration: const Duration(seconds: 5),
                onFinish: () {
                  bloc.refreshSeed();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LoadingStateView extends StatelessWidget {
  const _LoadingStateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 32,
            width: 32,
            child: CircularProgressIndicator(),
          ),
          const SizedBox(height: Dimensions.regular),
          Text(
            S.of(context).generateSeedLoadingLabel,
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}

class _SuccessStateView extends StatelessWidget {
  const _SuccessStateView({
    Key? key,
    required this.seed,
    required this.bloc,
  }) : super(key: key);
  final Seed seed;
  final GenerateSeedPageBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.regular),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: Dimensions.regular),
            LayoutBuilder(
              builder: (_, BoxConstraints constraints) {
                return SizedBox(
                  width: constraints.maxWidth * 0.7,
                  height: constraints.maxWidth * 0.7,
                  child: QrImage(
                    padding: EdgeInsets.zero,
                    data: json.encode(seed),
                  ),
                );
              },
            ),
            const SizedBox(height: Dimensions.regular),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  S.of(context).generateSeedExpiresLabel,
                  style: Theme.of(context).textTheme.caption,
                ),
                const SizedBox(width: Dimensions.xSmall),
                CountDownTimer(
                  key: UniqueKey(),
                  duration: seed.expiration.difference(
                    DateTime.now(),
                  ),
                  onFinish: () {
                    bloc.refreshSeed();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
