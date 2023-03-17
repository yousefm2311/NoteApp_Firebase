// ignore_for_file: file_names

import 'package:flutter/material.dart';

buildItemMenu({
  required int value,
  required Function() onTap,
  Widget? icon,
  required Widget text,
  required bool isBorder,
}) =>
    PopupMenuItem(
      value: value,
      onTap: onTap,
      child: Container(
        decoration: isBorder
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                  color: Colors.grey,
                ),
              )
            : null,
        child: ListTile(
          leading: icon,
          title: text,
        ),
      ),
    );
