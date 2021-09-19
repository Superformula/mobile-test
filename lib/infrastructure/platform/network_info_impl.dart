import 'package:injectable/injectable.dart';
import 'package:superformula_mobile_test/domain/platform/i_network_info.dart';
import 'package:superformula_mobile_test/locator.dart';
import 'data_connection_checker.dart';

@LazySingleton(as: INetworkInfo)
class NetworkInfoImpl implements INetworkInfo {
  final _connectionChecker = locator<DataConnectionChecker>();

  @override
  Future<bool> get isConnected => _connectionChecker.hasConnection;
}
