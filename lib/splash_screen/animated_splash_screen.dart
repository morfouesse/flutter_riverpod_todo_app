import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_todo_app/constants/constants.dart';
import 'package:flutter_riverpod_todo_app/splash_screen/splash_screen_wrapper.dart';
import 'package:flutter_riverpod_todo_app/style/colors/colors_constants.dart';
import 'package:page_transition/page_transition.dart';

class AnimatedSplash extends StatelessWidget {
  const AnimatedSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return AnimatedSplashScreen(
      //logo de démarrage
      splash: logo,
      //Classe à utiliser après l'écran de démarrage
      nextScreen: const SplashScreenWrapper(),

      backgroundColor: primaryColor,

      //durée de l'animation
      duration: 3000,
      //taile de l'image/logo
      splashIconSize: 500,
      //Transition avec la page d'après
      pageTransitionType: PageTransitionType.rightToLeftWithFade,
    );
  }
}
