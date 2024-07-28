import 'package:atmata/presentation/quiz/cubit/cubit.dart';
import 'package:atmata/presentation/quiz/cubit/states.dart';
import 'package:atmata/presentation/resources/assets_manager.dart';
import 'package:atmata/presentation/resources/color_manager.dart';
import 'package:atmata/presentation/resources/strings_manager.dart';
import 'package:atmata/presentation/resources/values_manager.dart';
import 'package:atmata/shared/next_button.dart';
import 'package:atmata/shared/option_card.dart';
import 'package:atmata/shared/question_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => QuizCubit(),
      child: BlocConsumer<QuizCubit, QuizStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = QuizCubit.get(context);
          return Scaffold(
            backgroundColor: ColorManager.darkPrimary,
            body: Stack(
              children: [
                Container(
                  width: double.infinity,
                  padding:
                  const EdgeInsets.symmetric(horizontal: AppPadding.p30),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImageAssets.mathBackground),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p30),
                  decoration:  BoxDecoration(
                    color: ColorManager.darkPrimary.withOpacity(0.85)
                  ),
                  child: Column(
                    children: [
                      AppBar(
                        systemOverlayStyle: SystemUiOverlayStyle(
                            statusBarColor: ColorManager.darkPrimary,
                            statusBarIconBrightness: Brightness.light),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        actions: [
                          Padding(
                            padding: const EdgeInsets.all(AppPadding.p8),
                            child: Text('${AppStrings.score} : ${cubit.score}',style: Theme.of(context).textTheme.titleLarge?.copyWith(color: ColorManager.white),),
                          )
                        ],
                      ),
                      QuestionWidget(
                          question: cubit.questions[cubit.index].title,
                          id: cubit.index,
                          total: cubit.questions.length),
                      const SizedBox(
                        height: AppSize.s28,
                      ),
                      for (int i = 0;
                          i < cubit.questions[cubit.index].options.length;
                          i++)
                        GestureDetector(
                          onTap: () => cubit.pressedOption(cubit
                              .questions[cubit.index].options.values
                              .toList()[i]),
                          child: OptionCard(
                            option: cubit.questions[cubit.index].options.keys
                                .toList()[i],
                            color: cubit.isPressed
                                ? cubit.questions[cubit.index].options.values
                                            .toList()[i] ==
                                        true
                                    ? ColorManager.correct
                                    : ColorManager.wrong
                                : ColorManager.white,
                          ),
                        ),
                    ],
                  ),
                ),

              ],
            ),
            floatingActionButton: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
              child: NextButton(
                nextFunction: () {
                  cubit.nextQuestion(context);
                },
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        },
      ),
    );
  }
}
