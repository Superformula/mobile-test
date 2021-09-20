import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_generator/data/api/api.dart';
import 'package:qr_generator/data/qr_generator/repository/qr_generator_repo_impl.dart';
import 'package:qr_generator/domain/qr_generator/cubit/generator_cubit.dart';
import 'package:qr_generator/presentation/qr_generator/widgets/qr_view.dart';

class QRGeneratorScreen extends StatefulWidget {
  const QRGeneratorScreen({Key? key}) : super(key: key);

  @override
  State<QRGeneratorScreen> createState() => _QRGeneratorState(
        GeneratorCubit(
          QRGeneratorRepositoryImpl(QRApiImpl()),
        )..setLifeCycleEvent(AppLifecycleState.resumed),
      );
}

class _QRGeneratorState extends State<QRGeneratorScreen>
    with WidgetsBindingObserver {
  _QRGeneratorState(this.cubit);

  final GeneratorCubit cubit;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    cubit.setLifeCycleEvent(AppLifecycleState.detached);
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    cubit.setLifeCycleEvent(state);
    if (state == AppLifecycleState.resumed) {
      cubit.generateQR();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GeneratorCubit>(
      create: (_) => cubit..generateQR(),
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
              return QRView(
                qrData: state.qrData,
                secondsToExpire: state.secondsToExpire,
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
