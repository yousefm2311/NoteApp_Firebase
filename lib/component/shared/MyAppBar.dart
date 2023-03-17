// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar(
      {super.key,
      required this.title,
      this.backgroundColor,
      this.leading,
      required this.actions});

  final List<Widget> actions;
  Widget? leading;
  Color? backgroundColor;
  final Widget title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: backgroundColor,
        title: title,
        elevation: 0.6,
        leading: leading,
        actions: actions);
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
