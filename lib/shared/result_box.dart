import 'package:atmata/presentation/resources/strings_manager.dart';
import 'package:atmata/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '../presentation/resources/color_manager.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({Key? key,required this.result,required this.total,required this.startOver}) : super(key: key);

  final int result;
  final int total;
  final VoidCallback startOver;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorManager.darkPrimary,
      content: Padding(
        padding: const EdgeInsets.all(AppPadding.p30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("SCORE",style: Theme.of(context).textTheme.displayLarge?.copyWith(color: ColorManager.white),),
            const SizedBox(height: AppSize.s20,),
            CircleAvatar(
              radius: AppSize.s65,
              backgroundColor:
                  result == total/2 ?
                  ColorManager.primary :
                    result < total/2 ?
                    ColorManager.wrong :
                    ColorManager.correct,
              child: Text("$result/$total",style: Theme.of(context).textTheme.displayLarge?.copyWith(color: ColorManager.white),),
            ),
            const SizedBox(height: AppSize.s20,),
            Text(
              result == total/2 ?
              AppStrings.closeEnough :
              result < total/2 ?
              AppStrings.tryAgain :
              AppStrings.wellDone,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(color: ColorManager.white),
            ),
            const SizedBox(height: AppSize.s20,),
            GestureDetector(
              onTap: startOver,
              child: Text(
                AppStrings.startOver,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(color: ColorManager.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
