import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp_with_firebase/component/shared/MyAppBar.dart';
import 'package:noteapp_with_firebase/component/shared/gridview.dart';
import 'package:noteapp_with_firebase/component/shared/icon_broken.dart';
import 'package:noteapp_with_firebase/modules/homepage/cubit/cubit.dart';
import 'package:noteapp_with_firebase/modules/homepage/cubit/state.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../../component/shared/PopMenuItem.dart';
import '../../component/shared/PopUpMenu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteAppCubit, NoteAppState>(
      builder: (context, state) {
        NoteAppCubit cubit = NoteAppCubit.get(context);
        return Scaffold(
          appBar: MyAppBar(
            actions: [
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
                    text: const Text('View'),
                    value: 1,
                  ),
                  buildItemMenu(
                    isBorder: false,
                    icon: cubit.isDark
                        ? const Icon(Icons.dark_mode_rounded)
                        : const Icon(Icons.light_mode_rounded),
                    onTap: () {
                      cubit.changeTheme();
                    },
                    text:
                        cubit.isDark ? const Text('Dark') : const Text('Light'),
                    value: 2,
                  ),
                ],
                icon: const Icon(Icons.more_vert),
                menuList2: [
                  buildItemMenu(
                    isBorder: false,
                    onTap: () {},
                    text: const Text('Grid (small)'),
                    value: 3,
                  ),
                  buildItemMenu(
                    isBorder: false,
                    onTap: () {},
                    text: const Text('Grid (Medium)'),
                    value: 4,
                  ),
                  buildItemMenu(
                    isBorder: false,
                    onTap: () {},
                    text: const Text('Grid (Large)'),
                    value: 5,
                  ),
                ],
              )
            ],
            title: const Text('All Notes'),
          ),
          drawer: const Drawer(),
          body: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Icon(
                        IconBroken.Arrow___Down_Circle,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        "Date created",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: StaggeredGridView.countBuilder(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return const MyGridView();
                    },
                    crossAxisCount: 2,
                    mainAxisSpacing: 1.0,
                    staggeredTileBuilder: (int index) {
                      return StaggeredTile.count(1, index.isEven ? 1.4 : 1.2);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
