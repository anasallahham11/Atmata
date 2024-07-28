
//import 'package:e_school/language/language_constants.dart';
import 'package:atmata/layout/home_layout/cubit/cubit.dart';
import 'package:atmata/layout/home_layout/cubit/states.dart';
//import 'package:e_school/shared/components/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class HomeLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit,LayoutStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = LayoutCubit.get(context);
            return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (index)
                {
                  cubit.changeBottomNavBar(index);
                },
                items: cubit.bottomItems,
              ),
             // drawer: TheMenu(translation(context).student, translation(context).account, 'assets/icons/graduating-student-b.png'),
              body:cubit.screens[cubit.currentIndex],
            );
        },
      ),
    );
  }
}