import 'package:flutter/material.dart';
import 'package:flutter_riverpod_todo_app/screens/home/todolist_screen.dart';
import 'package:flutter_riverpod_todo_app/screens/login/login_screen.dart';
import 'package:flutter_riverpod_todo_app/screens/register/register_screen.dart';

class SplashScreenWrapper extends StatelessWidget {
  const SplashScreenWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: connexion, inscription à gérer
    //Si pas d'user, page de connexion
    //Si user, page d'accueil
    //  if (user == null) {
    //    return const Login();
    //  }
    //  String uid = user.uid;

    //return const RegisterScreen();
    return const Todolist();
  }
}
