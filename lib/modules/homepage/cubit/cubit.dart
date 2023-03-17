import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp_with_firebase/modules/homepage/cubit/state.dart';

class NoteAppCubit extends Cubit<NoteAppState> {
  NoteAppCubit() : super(InitialNoteAppState());

  List<Color> colors = [
    Colors.tealAccent,
    Colors.white,
    Colors.blueAccent,
    Colors.blueGrey,
    Colors.orangeAccent,
    Colors.purpleAccent,
    Colors.yellowAccent,
    Colors.brown,
    Colors.greenAccent,
    Colors.lightBlueAccent,
    Colors.grey,
  ];

  static NoteAppCubit get(context) => BlocProvider.of(context);

  Color currentColor = const Color.fromARGB(255, 255, 255, 255);
  int? item;

  void getIndex(index) {
    item = index;
    emit(GetImdexNoteApp());
  }

  void changeColor(color) {
    currentColor = color;
    emit(ChangeColorNoteApp());
  }

  bool isDark = false;
  void changeTheme() {
    isDark = !isDark;
    emit(ChangeThemeNoteApp());
  }
}
