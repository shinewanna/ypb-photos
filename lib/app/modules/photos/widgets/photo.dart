import 'dart:io';
import 'package:flutter/material.dart';

class Photo extends Container {
  final String path;
  final VoidCallback onTap;

  Photo({required this.path, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image(
        image: FileImage(File(path)),
        fit: BoxFit.cover,
      ),
    );
  }
}
