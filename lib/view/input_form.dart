import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputForm extends ConsumerWidget {
  const InputForm({
    super.key,
    required this.width,
    required this.height,
    required this.labelText,
    required this.controller,
    required this.formColor,
    required this.contentPadding,
    required this.obscureText,
  });

  final double width;
  final double height;
  final String labelText;
  final TextEditingController controller;
  final Color formColor;
  final double contentPadding;
  final bool obscureText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: formColor,
      width: width,
      height: height,
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: contentPadding),
        ),
      ),
    );
  }
}
