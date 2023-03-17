// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField(
      {super.key, required this.isShow, required this.maxLine, required this.text});

  final bool isShow;
  final maxLine;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLine,
      decoration: InputDecoration(
        hintText: text,
        enabledBorder: OutlineInputBorder(
          borderSide: isShow
              ? BorderSide(color: Colors.grey.shade300)
              : BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: isShow
              ? BorderSide(color: Colors.grey.shade300)
              : BorderSide.none,
        ),
      ),
    );
  }
}
