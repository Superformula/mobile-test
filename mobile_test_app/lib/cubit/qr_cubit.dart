import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_test_app/model/qr_code.dart';

part 'qr_state.dart';

class QrCubit extends Cubit<QrState> {
  QrCubit() : super(QrInitial());
}
