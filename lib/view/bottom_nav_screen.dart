import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/app_bloc/app_cubit.dart';
import '../../logic/app_bloc/app_states.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // شرط اساسي انك تكنسيوم على البلوك في اول الصفحه او في الجزء اللي هتسخدم البلوك فيها
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if(state is ChangeBotNavState){
          print('test');
        }
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.white,
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.shifting,
              currentIndex: cubit.currentIndex,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.blue,
              showUnselectedLabels: true,
              showSelectedLabels: false,
              unselectedLabelStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              iconSize: 30,
              onTap: (index) => cubit.changeBot(index, context),
              items: cubit.getTabs(context),
            ),
          ),
        );
      },
    );
  }
}