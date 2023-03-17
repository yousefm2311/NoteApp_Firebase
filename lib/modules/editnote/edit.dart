// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:noteapp_with_firebase/component/shared/MyAppBar.dart';
import 'package:noteapp_with_firebase/component/shared/component.dart';
import 'package:noteapp_with_firebase/component/shared/icon_broken.dart';
import 'package:noteapp_with_firebase/modules/homepage/cubit/cubit.dart';
import 'package:noteapp_with_firebase/modules/homepage/cubit/state.dart';

import '../../component/shared/MyTextField.dart';
import '../../component/shared/PopMenuItem.dart';
import '../../component/shared/PopUpMenu.dart';

class EditNote extends StatelessWidget {
  EditNote({super.key});

  Color pickerColor = const Color.fromARGB(255, 255, 255, 255);

  
  int item = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteAppCubit, NoteAppState>(
      builder: (context, state) {
        NoteAppCubit cubit = NoteAppCubit.get(context);
        return Scaffold(
          backgroundColor: cubit.currentColor,
          appBar: MyAppBar(
            backgroundColor:
                cubit.item != null ? cubit.colors[cubit.item!] : null,
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Color Picker'),
                        content: SingleChildScrollView(
                          child: ColorPicker(
                              pickerColor: pickerColor,
                              onColorChanged: (color) {
                                pickerColor = color;
                              }),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            child: const Text('Got it'),
                            onPressed: () {
                              cubit.changeColor(pickerColor);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.color_lens_rounded),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.manage_search_rounded),
              ),
              PopUpMenu(
                menuList: [
                  buildItemMenu(
                    isBorder: true,
                    icon: const Icon(Icons.view_module_rounded),
                    onTap: () {},
                    text: const Text('backgroundColor'),
                    value: 1,
                  ),
                  buildItemMenu(
                    isBorder: false,
                    icon: const Icon(Icons.dark_mode_rounded),
                    onTap: () {},
                    text: const Text('Sava as'),
                    value: 2,
                  ),
                ],
                icon: const Icon(Icons.more_vert),
                menuList2: [
                  buildItemMenu(
                    isBorder: false,
                    onTap: () {},
                    text: Row(
                      children: [
                        Expanded(
                            child: SizedBox(
                          height: 50,
                          width: 120,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: cubit.colors.length,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  buildColor(
                                    color: cubit.colors[index],
                                    onTap: () {
                                      cubit.changeColor(cubit.colors[index]);
                                      cubit.getIndex(index);
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        )),
                      ],
                    ),
                    value: 3,
                  ),
                ],
              )
            ],
            title: const MyTextFormField(
              isShow: false,
              text: 'title',
              maxLine: 1,
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(IconBroken.Arrow___Left_2)),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: const [
                MyTextFormField(
                  isShow: false,
                  text: 'add note',
                  maxLine: 50,
                )
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
