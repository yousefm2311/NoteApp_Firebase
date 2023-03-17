import 'package:flutter/material.dart';

Widget buildColor({required Color color,required Function() onTap}) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: color,
              border: Border.all(color: Colors.grey.shade300, width: 0.3)),
          width: 20,
          height: 30,
        ),
      ),
    );
