import 'package:flutter/material.dart';
import 'package:flutter_riverpod_todo_app/constants/routes_constants.dart';

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
        child: ElevatedButton(
          onPressed: () => Navigator.pushNamed(
            context,
            todoListRoute,
          ),
          child: const Text('S\'inscrire'),
        ),
      ),
    );
  }
}
