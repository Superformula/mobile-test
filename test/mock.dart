import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:qrtestcodeone/data/datasource/qrcode_service_datasource.dart';
import 'package:qrtestcodeone/data/model/qr_seed_datamodel.dart';
import 'package:qrtestcodeone/domain/repository/qrcode_repository.dart';
import 'package:qrtestcodeone/feature/home/bloc/home_bloc.dart';

///
/// Created by Pablo Reyes [devpab@gmail.com] on 7/20/21.
///

/// ## Bloc

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

/// ## Other

class MockQrCodeRepository extends Mock implements QrCodeRepository {}

class MockQrCodeServiceDataSource extends Mock
    implements QrCodeServiceDataSource {}

@GenerateMocks([
  MockQrCodeRepository,
  MockQrCodeServiceDataSource,
], customMocks: [
  MockSpec<QrSeedDataModel>(returnNullOnMissingStub: true),
])
void main() {}
