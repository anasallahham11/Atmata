abstract class QuizStates{}

class QuizInitialState extends QuizStates{}

class QuizLoadingState extends QuizStates{}

class QuizSuccessState extends QuizStates{}

class QuizErrorState extends QuizStates{
  final String error;
  QuizErrorState(this.error);
}

class QuizNextQuestionState extends QuizStates{}

class QuizOptionPressedState extends QuizStates{}

class QuizStartOverState extends QuizStates{}