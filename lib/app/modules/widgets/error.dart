import 'package:flutter/material.dart';

class Err extends Container {
  final String error;

  Err(this.error);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        error,
        style: const TextStyle(
          color: Colors.red,
          fontSize: 25,
        ),
      ),
    );
  }
}
