import 'package:mockito/mockito.dart';
import 'package:qr_code/api/api_client.dart';
import 'package:qr_code/redux/app_state.dart';
import 'package:redux/redux.dart';

class StoreMock extends Mock implements Store<AppState> {}

class ApiClientMock extends Mock implements ApiClient {}
