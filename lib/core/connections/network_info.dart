import 'package:data_connection_checker_tv/data_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool>? get connected;
}

class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker _connectionChecker;

  NetworkInfoImpl(this._connectionChecker);
  @override
  Future<bool> get connected => _connectionChecker.hasConnection;
}
