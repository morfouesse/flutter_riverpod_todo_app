import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// on observe l'état de la connexion internet et
/// on détruit le provider quand on ne l'utilise plus (autoDispose)
final connectivityChangeNotifierProvider =
    ChangeNotifierProvider.autoDispose<ConnectivityChangeNotifier>((ref) {
  return ConnectivityChangeNotifier();
});

// on utilise l'heritage ChangdeNotifier pour écouter les changements
class ConnectivityChangeNotifier extends ChangeNotifier {
  ConnectivityChangeNotifier() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      resultHandler(result);
    });
  }

  /// la connection courrante
  ConnectivityResult _connectivityResult = ConnectivityResult.none;
  String _pageText = "Vous n'avez pas internet 😥";

  ConnectivityResult get connectivity => _connectivityResult;
  String get pageText => _pageText;

  void resultHandler(ConnectivityResult result) {
    _connectivityResult = result;
    if (result == ConnectivityResult.none ||
        result == ConnectivityResult.mobile) {
      _pageText = "";
    }
    notifyListeners();
  }
}
