import 'package:flutter/material.dart';
import 'package:flutter_riverpod_todo_app/style/colors/colors_constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("hi"),
            Text(
              "hi erreur",
              style: TextStyle(color: erreurTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
