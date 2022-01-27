import 'package:flutter/material.dart';

class ShowError extends StatelessWidget {
  const ShowError({Key? key, required this.message}) : super(key: key);

  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
      ),
    );
  }
}
