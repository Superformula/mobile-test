import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_test/app/dependencies.dart';
import 'package:mobile_test/base/result_state.dart';
import 'package:mobile_test/detail/cubit/qr_detail_cubit.dart';
import 'package:mobile_test/widgets/loading_indicator.dart';
import 'package:mobile_test/widgets/timer_text.dart';
import 'package:qr_api/qr_api.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_models/qr_models.dart';

final time = DateTime.now().add(const Duration(seconds: 5));

class QrDetailScreen extends StatefulWidget {
  const QrDetailScreen({Key? key}) : super(key: key);

  static Widget init() {
    final repository = getIt.get<SeedRepository>();
    return BlocProvider(
      create: (_) => QrDetailCubit(repository),
      child: const QrDetailScreen(),
    );
  }

  @override
  State<QrDetailScreen> createState() => _QrDetailScreenState();
}

class _QrDetailScreenState extends State<QrDetailScreen> {
  @override
  void initState() {
    super.initState();
    context.read<QrDetailCubit>().getQrSeed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code'),
      ),
      body: BlocConsumer<QrDetailCubit, ResultState<QRSeed>>(
        builder: (context, state) {
          return state.when(
            initial: () => Container(),
            loading: () => const LoadingIndicator(),
            data: (data) => QrDetailSuccessPage(seed: data),
            error: (e) => ErrorPage(message: e),
          );
        },
        listener: (context, state) {
          if (state is Error) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Something goes wrong :('),
              ),
            );
          }
        },
      ),
    );
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key, this.message = ''}) : super(key: key);

  final String message;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.error, color: Colors.red),
        Text(message),
      ],
    );
  }
}

class QrDetailSuccessPage extends StatelessWidget {
  const QrDetailSuccessPage({Key? key, required this.seed}) : super(key: key);

  final QRSeed seed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          QrImage(
            data: seed.seed,
            size: 200,
          ),
          const SizedBox(height: 16),
          Text(
            "This QR code it's going to expire in",
            style: theme.textTheme.subtitle1,
          ),
          CountDownTimerText(
            onTimerFinish: () => context.read<QrDetailCubit>().getQrSeed(),
            remainingTime: time.second,
          ),
        ],
      ),
    );
  }
}
