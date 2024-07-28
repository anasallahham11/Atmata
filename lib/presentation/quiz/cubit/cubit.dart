import 'package:atmata/presentation/quiz/cubit/states.dart';
import 'package:atmata/presentation/resources/color_manager.dart';
import 'package:atmata/presentation/resources/strings_manager.dart';
import 'package:atmata/shared/result_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/question_model.dart';

class QuizCubit extends Cubit<QuizStates>{

  QuizCubit() : super(QuizInitialState());
  static QuizCubit get(context) => BlocProvider.of(context);

  List<Question> questions = [
    Question(id: 10, title: "What is 1+1?", options: {"1":false,"2":true,"3":false,"4":false}),
    Question(id: 20, title: "What is 2+2?", options: {"1":false,"2":false,"3":false,"4":true}),
    Question(id: 30, title: "What is 1+3?", options: {"1":false,"2":false,"3":true,"4":false}),
  ];

  int index =0;

  bool isPressed = false;

  bool isOptionSelected = false;

  int score = 0;

  void startOver(context){
    index=0;
    score=0;
    isPressed=false;
    isOptionSelected=false;
    Navigator.pop(context);
    emit(QuizStartOverState());
  }

  void pressedOption(bool value){
    if(isOptionSelected)
      {
        return;
      }
    else{
      if(value==true)
      {score++;}
      isPressed = true;
      isOptionSelected = true;
      emit(QuizOptionPressedState());
    }

  }

  void nextQuestion(context){
    if(index==questions.length-1 && isPressed) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx)=>ResultBox(
            result: score,
            total: questions.length,
            startOver: (){startOver(context);},
          ),
      );
    }else{
      if(isPressed){
        index ++;
        isPressed = false;
        isOptionSelected=false;
        emit(QuizNextQuestionState());
      }else{
        showToast(
            text: AppStrings.selectOption,
            state: ToastStates.WARNING
        );
      }

  }
  }


}