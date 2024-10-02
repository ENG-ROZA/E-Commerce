import 'package:connectivity_plus/connectivity_plus.dart';

extension NetworkExtensions on Connectivity {
  Future<bool> isInternetConnected() async {
    ConnectivityResult connectivityResult = (await checkConnectivity()) as ConnectivityResult;
    if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else {
      return false;
    }
  }
}
