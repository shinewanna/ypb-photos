import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomTextField extends Container {
  final TextEditingController? controller;
  final String? label;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final String? value;

  CustomTextField({
    this.controller,
    this.label,
    this.onChanged,
    this.keyboardType,
    this.value,
  });
  @override
  Widget build(BuildContext context) {
    final decoration = InputDecoration(
      contentPadding: const EdgeInsets.only(
        left: 15.0,
        top: 15.0,
      ),
      isDense: true,
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
    );
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: decoration,
      onChanged: onChanged,
      initialValue: value,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      autovalidateMode: AutovalidateMode.always,
    ).p8();
  }
}
