import 'package:atmata/presentation/resources/color_manager.dart';
import 'package:atmata/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({Key? key,required this.option,required this.color}) : super(key: key);
  final String option;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          trailing:
              color == ColorManager.white ?
              null :
              color == ColorManager.correct ?
              Icon(Icons.check_circle,color: color,size: AppSize.s30,)  :
              Icon(Icons.close_outlined,color: color,size: AppSize.s30,),
          title: Text(
            option,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge?.
            copyWith(
                color: ColorManager.darkPrimary
            ),
          ),
        ),
      ),
    );
  }
}
