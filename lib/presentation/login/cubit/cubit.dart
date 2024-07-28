

import 'package:atmata/presentation/login/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/network/dio_helper.dart';
import '../../../models/login_model.dart';

class LoginCubit extends Cubit<LoginStates>{

  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);


  LoginModel? loginModel;

  void userLogin ({
      deviceToken,
    required  email,
    required  password,
})
  {
    emit(LoginLoadingState());
    DioHelper.postData(
        url: "LOGIN",
        data: 
        {
          'email':email,
          'password':password,
          'FCM_token':deviceToken
        }
    ).then((value) {
      print(value?.data);
      // loginModel = LoginModel.fromJson(value?.data);
      // print(loginModel!.data?.token);
      // print(loginModel!.status);
      // print(loginModel!.message);
      emit(LoginSuccessState(loginModel!));
    }).catchError((error){
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;
  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LoginChangePasswordVisibilityState());

  }

}