import 'package:atmata/layout/home_layout/cubit/states.dart';
import 'package:atmata/presentation/quiz/quiz_screen.dart';
import 'package:atmata/presentation/resources/strings_manager.dart';

// import 'package:e_school/modules/home/home_screen.dart';
// import 'package:e_school/modules/posts/posts_screen.dart';
// import 'package:e_school/modules/profile/profile_screen.dart';
// import 'package:e_school/modules/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../presentation/about/about_screen.dart';
import '../../../presentation/home/home_screen.dart';
import '../../../presentation/settings/settings_screen.dart';


class LayoutCubit extends Cubit<LayoutStates>
{
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex= 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label:AppStrings.home,
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.info_rounded),
      label:AppStrings.about,
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label:AppStrings.settings,
    ),
  ];

  List<Widget> screens = [
    HomeScreen(),
    QuizScreen(),
    SettingsScreen(),

  ];
  void changeBottomNavBar(int index)
  {
    currentIndex= index;
    emit(LayoutBottomNavState());
  }


  }

