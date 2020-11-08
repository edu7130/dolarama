import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  String error;

  ErrorMessage({this.error});

  @override
  Widget build(BuildContext context) {
    print("error message");
    return Text(
      this.error == null ? "Ha ocurrido un error!" : this.error,
      style: TextStyle(color: Colors.red, fontSize: 20),
    );
  }
}
