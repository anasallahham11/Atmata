import 'package:atmata/presentation/home/cubit/home_cubit.dart';
import 'package:atmata/presentation/home/cubit/home_states.dart';
import 'package:atmata/presentation/resources/strings_manager.dart';
import 'package:atmata/shared/components.dart';
import 'package:atmata/shared/subject_card.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';

class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: BlocConsumer<HomeCubit,HomeStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarBrightness: Brightness.light,
                statusBarColor: ColorManager.primary
              ),
              title:  Text(
                  AppStrings.home,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: ColorManager.white),
              ),
            ),
            body: Center(
              child: ListView.builder(
                itemCount: cubit.subjectsList.length,
                  itemBuilder: (context,index)=>cubit.subjectsList[index],
                physics: const BouncingScrollPhysics(),
              ),
            ),
          );
        },
      ),
    );
  }
}
