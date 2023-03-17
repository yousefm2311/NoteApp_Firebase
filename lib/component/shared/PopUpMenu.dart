// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PopUpMenu extends StatelessWidget {
  const PopUpMenu(
      {super.key,
      required this.menuList,
      required this.icon,
      required this.menuList2});

  final List<PopupMenuEntry> menuList;
  final List<PopupMenuEntry> menuList2;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      icon: icon,
      onSelected: (value) {
        if (kDebugMode) {
          switch (value) {
            case 1:
              showMenu(
                initialValue: value,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                context: context,
                position: const RelativeRect.fromLTRB(
                    double.infinity, 0, 0, double.infinity),
                items: menuList2,
              );
              break;
            default:
          }
        }
      },
      clipBehavior: Clip.hardEdge,
      itemBuilder: (context) {
        return menuList;
      },
    );
  }
}
