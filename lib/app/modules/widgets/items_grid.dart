import 'package:flutter/material.dart';

class ItemGrid extends Container {
  final List<Widget> children;

  ItemGrid({required this.children});
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: children,
    );
  }
}
