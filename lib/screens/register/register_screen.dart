import 'package:flutter/material.dart';
import 'package:flutter_riverpod_todo_app/style/colors/colors_constants.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
