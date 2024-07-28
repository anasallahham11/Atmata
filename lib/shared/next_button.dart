import 'package:atmata/presentation/resources/color_manager.dart';
import 'package:atmata/presentation/resources/strings_manager.dart';
import 'package:atmata/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key,required this.nextFunction}) : super(key: key);
  final VoidCallback? nextFunction;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: nextFunction,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p12),
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(AppSize.s12)
        ),
        child: Text(
          AppStrings.nextQuestion,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(color: ColorManager.darkPrimary),),
      ),
    );
  }
}
