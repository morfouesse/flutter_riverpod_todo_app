import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod_todo_app/screens/register/register_screen.dart';
import 'package:flutter_riverpod_todo_app/splash_screen/animated_splash_screen.dart';
import 'package:flutter_riverpod_todo_app/style/colors/colors_constants.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/animatedSplash':
        return MaterialPageRoute(
        builder: (context) => AnimatedSplash(),
      );
    //  case '/':
    //    //Si utilisateur connecter renvoies vers l'accueil sinon, vers la page de connexion
    //    return MaterialPageRoute(builder: (context) => SplashScreenWrapper());

    //  case '/login':
    //    return MaterialPageRoute(
    //      builder: (context) => LoginScreen(),
    //    );

      case '/register':
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        );

      default:
        return pageNotFound();
    }
  }

  static MaterialPageRoute pageNotFound() {
    return MaterialPageRoute(
        builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text(
                "Erreur",
              ),
              centerTitle: true,
              backgroundColor: primaryColor,
            ),
            body: const Center(
              child: Text(
                "Page non trouvée",
                style: TextStyle(color: erreurTextColor),
              ),
            ),
            ),
            );
  }
}