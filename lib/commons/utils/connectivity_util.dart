import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class ConnectivityUtil {
  final connectivity = Connectivity();

  var networkType = ValueNotifier<ConnectivityResult>(ConnectivityResult.none);

  bool get hasConnection => _hasConnection();

  ConnectivityUtil();

  Future listen() async {
    networkType.value = await connectivity.checkConnectivity();
    connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      networkType.value = result;
      networkType.notifyListeners();
    });
  }

  bool _hasConnection() {
    switch (networkType.value) {
      case ConnectivityResult.none:
        return false;
      default:
        return true;
    }
  }
}
