
import 'package:atmata/presentation/home/cubit/home_states.dart';
import 'package:atmata/presentation/resources/assets_manager.dart';
import 'package:atmata/shared/subject_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<SubjectCard> subjectsList =[
    SubjectCard(subject: "MATH",imageUrl: ImageAssets.mathBackground,),
    SubjectCard(subject: "PHYSICS",imageUrl: ImageAssets.physicsBackground,),
    SubjectCard(subject: "ENGLISH",imageUrl: ImageAssets.englishBackground,),
    SubjectCard(subject: "CHEMISTRY",imageUrl: ImageAssets.chemistryBackground,),
    SubjectCard(subject: "ARABIC",imageUrl: ImageAssets.arabicBackground,),
    SubjectCard(subject: "SCIENCE",imageUrl: ImageAssets.scienceBackground,),
    SubjectCard(subject: "FRENCH",imageUrl: ImageAssets.frenchBackground,),
    SubjectCard(subject: "RELIGION",imageUrl: ImageAssets.religionBackground,),
    SubjectCard(subject: "WATANIA",imageUrl: ImageAssets.wataniaBackground,),

  ];


}

