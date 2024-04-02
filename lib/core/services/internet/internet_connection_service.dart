import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

import '../../exceptions/app_exceptions.dart';

abstract class InternetConnectionService {
  Future<void> checkConnectivityState();
}

@LazySingleton(as: InternetConnectionService)
class InternetConnectionServiceImpl implements InternetConnectionService {
  final Connectivity connectivity;

  InternetConnectionServiceImpl({required this.connectivity});

  @override
  Future<void> checkConnectivityState() async {
    try {
      final List<ConnectivityResult> result =
          await connectivity.checkConnectivity();
      if (result.contains(ConnectivityResult.wifi)) {
        return;
      } else if (result.contains(ConnectivityResult.wifi)) {
        return;
      } else {
        throw const InternetConnectionException();
      }
    } on Exception catch (e) {
      throw InternetConnectionException(message: e.toString());
    }
  }
}
