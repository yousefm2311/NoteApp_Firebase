import 'package:flutter/material.dart';
import 'package:noteapp_with_firebase/modules/editnote/edit.dart';

import '../../modules/homepage/cubit/cubit.dart';

class MyGridView extends StatelessWidget {
  const MyGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 20),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditNote(),
              ));
        },
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              color: NoteAppCubit.get(context).isDark
                  ? Colors.grey[700]
                  : Colors.grey[200],
              borderRadius: BorderRadius.circular(15.0)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Text Note  3/17",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "1:05 am",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 5.0),
                const Expanded(child: Text("Contants ")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
