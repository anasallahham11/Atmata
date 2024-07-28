import 'package:atmata/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

import '../presentation/resources/color_manager.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({Key? key,required this.question,required this.id,required this.total}) : super(key: key);

  final String question;
  final int id;
  final int total;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text("${AppStrings.question} ${id + 1}/$total :\n$question",
          style: Theme.of(context).textTheme.displayLarge?.copyWith(color: ColorManager.white,
        ),
      ),
    );
  }
}
