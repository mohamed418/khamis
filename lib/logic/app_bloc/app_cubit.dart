import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khames/widgets/bottom_nav/favourites_widget.dart';
import 'package:khames/widgets/bottom_nav/messages_widget.dart';
import 'package:khames/widgets/bottom_nav/profile_widget.dart';
import '../../widgets/bottom_nav/home_widget.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

// this line is how to create an object from the cubit
  static AppCubit get(context) => BlocProvider.of(context);

  // currentIndex to the bottom navigation bar
  int currentIndex = 0;

  // taps of the BNB
  List<BottomNavigationBarItem> getTabs(BuildContext context) {
    return [
      const BottomNavigationBarItem(
        icon: Icon(Icons.person,color: Colors.grey,),
        label: 'profile',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.favorite,color: Colors.grey,),
        label: 'favourites',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.message,color: Colors.grey,),
        label: 'messages',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.home,color: Colors.grey,),
        label: 'home',
      ),
    ];
  }

  // list of the 4 taps screens
  List<Widget> screens = [
    const ProfileWidget(),
    const FavouritesWidget(),
    const MessagesWidget(),
    const HomeWidget(),
  ];

// how to toggle between the taps
  void changeBot(index, context) async {
    emit(ChangeBotNavState());
    currentIndex = index;
    if (currentIndex == 0) {
      print(index);
    }
    if (currentIndex == 1) {}
    if (currentIndex == 2) {}
    if (currentIndex == 3) {}
  }
}