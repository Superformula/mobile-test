import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_generator/data/api/api.dart';
import 'package:qr_generator/data/qr_generator/repository/qr_generator_repo_impl.dart';
import 'package:qr_generator/domain/qr_generator/cubit/generator_cubit.dart';

class QRGeneratorScreen extends StatelessWidget {
  const QRGeneratorScreen({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider<GeneratorCubit>(
      create: (_) =>
          GeneratorCubit(QRGeneratorRepositoryImpl(QRApiImpl()))..generateQR(),
      child: _QRGenerator(),
    );
  }
}

class _QRGenerator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code'),
      ),
      body: Center(
        child: BlocBuilder<GeneratorCubit, GeneratorState>(
          builder: (_, state) {
            if (state is GeneratedQR)
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  QrImage(
                    data: state.qrData,
                    version: QrVersions.auto,
                    size: 200,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    state.qrData,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    'Expires in ${state.secondsToExpire} second(s)...',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              );
            else if (state is GeneratorError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.errorMessage),
                  ElevatedButton.icon(
                    onPressed: () =>
                        context.read<GeneratorCubit>().generateQR(),
                    icon: Icon(Icons.refresh),
                    label: Text('Retry'),
                  )
                ],
              );
            } else
              return Text(
                state is GeneratorError ? state.errorMessage : 'Loading...',
                style: Theme.of(context).textTheme.bodyText1,
              );
          },
        ),
      ),
    );
  }
}
