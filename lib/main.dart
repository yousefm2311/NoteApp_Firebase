import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp_with_firebase/modules/homepage/cubit/cubit.dart';
import 'package:noteapp_with_firebase/modules/homepage/cubit/state.dart';
import 'package:noteapp_with_firebase/modules/homepage/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NoteAppCubit(),
      child: BlocConsumer<NoteAppCubit, NoteAppState>(
        builder: (context, state) {
          NoteAppCubit cubit = NoteAppCubit.get(context);
          return MaterialApp(
            theme: ThemeData(
              popupMenuTheme: const PopupMenuThemeData(
                color: Colors.white,
              ),
              iconTheme: const IconThemeData(
                color: Colors.black,
              ),
              appBarTheme: AppBarTheme(
                color: Colors.grey[200],
                titleTextStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
                iconTheme: const IconThemeData(color: Colors.black),
                elevation: 0,
              ),
            ),
            darkTheme: ThemeData(
              textTheme: const TextTheme(
                bodySmall: TextStyle(color: Colors.grey),
                bodyMedium: TextStyle(color: Colors.white70),
                bodyLarge: TextStyle(color: Colors.white, fontSize: 14.0),
              ),
              scaffoldBackgroundColor: Colors.black54,
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              popupMenuTheme: const PopupMenuThemeData(
                color: Colors.black54,
              ),
              appBarTheme: const AppBarTheme(
                color: Colors.black54,
                titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
                iconTheme: IconThemeData(color: Colors.white),
                elevation: 0,
              ),
            ),
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: const HomePage(),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
