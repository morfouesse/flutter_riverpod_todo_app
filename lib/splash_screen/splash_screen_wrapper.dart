import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_todo_app/connectivity/connectivity.dart';
import 'package:flutter_riverpod_todo_app/screens/home/todolist_screen.dart';
import 'package:flutter_riverpod_todo_app/screens/login/login_screen.dart';
import 'package:flutter_riverpod_todo_app/screens/no_connection/no_connection_screen.dart';
import 'package:flutter_riverpod_todo_app/screens/register/register_screen.dart';

class SplashScreenWrapper extends ConsumerWidget {
  const SplashScreenWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// on vérifie la co internet, s'il y en a pas alors on coupe l'acces
    /// à firebase en écriture, ça m'évite une erreur si on lance l'appli
    /// sans co internet
    /// on le fait qu'ici car on veut pouvoir profiter du mode hors-ligne
    /// de firebase sur les autres écrans
    bool ischeckConnectivity() {
      ConnectivityChangeNotifier connectivityChangeNotifier =
          ref.watch(connectivityChangeNotifierProvider);

      if (connectivityChangeNotifier.connectivity != ConnectivityResult.wifi &&
          connectivityChangeNotifier.connectivity !=
              ConnectivityResult.mobile) {
        FirebaseFirestore.instance.disableNetwork();
        return false;
      } else {
        FirebaseFirestore.instance.enableNetwork();
        return true;
      }
    }

    /// s'il y a internet alors on va sur s'inscrire sinon on affiche un
    /// autre écran
    return Scaffold(
      body: ischeckConnectivity() ? const Register() : const NoConnection(),
    );
  }

  //TODO: connexion, inscription à gérer
  //Si pas d'user, page de connexion
  //Si user, page d'accueil
  //  if (user == null) {
  //    return const Login();
  //  }
  //  String uid = user.uid;

}
