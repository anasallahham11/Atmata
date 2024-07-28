

import 'package:atmata/presentation/login/cubit/cubit.dart';
import 'package:atmata/presentation/login/cubit/states.dart';
import 'package:atmata/presentation/resources/assets_manager.dart';
import 'package:atmata/presentation/resources/color_manager.dart';
import 'package:atmata/presentation/resources/strings_manager.dart';
import 'package:atmata/presentation/resources/values_manager.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/components.dart';
import '../resources/routes_manager.dart';

class LoginScreen extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;


    return BlocProvider(
        create: (BuildContext context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginStates>(
           listener: (context, state) {
          //   if (state is LoginSuccessState) {
          //     if (state.loginModel.status == true) {
          //       CacheHelper.saveData(key: 'token', value: state.loginModel.data?.token).then((value) {
          //         token= state.loginModel.data?.token;
          //       });
          //       showToast(
          //           text: state.loginModel.message,
          //           state: ToastStates.SUCCESS
          //       );
          //
          //       if(state.loginModel.data?.role == 2){
          //         CacheHelper.saveData(key: 'userType', value: 'student').then((value) {
          //           userType='student';
          //         });
          //         navigateAndFinish(context, HomeLayout());
          //       }else if(state.loginModel.data?.role == 4){
          //         CacheHelper.saveData(key: 'userType', value: 'teacher').then((value) {
          //           userType='teacher';
          //         });
          //         navigateAndFinish(context, TeacherHomeLayout());
          //       }else{
          //         CacheHelper.saveData(key: 'userType', value: 'parent').then((value) {
          //           userType='parent';
          //         });
          //         navigateAndFinish(context, ParentHomeLayout());
          //       }
          //
          //     } else {
          //       print(state.loginModel.message);
          //       showToast(
          //           text: state.loginModel.message,
          //           state: ToastStates.ERROR
          //       );
          //     }
          //   }
           },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: ColorManager.primary,
              body: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: SizedBox(
                  height: height,
                  child: Stack(
                    children: [
                      Container(
                        height: height / 2.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: BorderRadius.circular(50),

                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: AppHeight.h120,
                            ),
                             const SizedBox(
                              height: AppHeight.h150,
                              child: Image(image: AssetImage(ImageAssets.appLogo)),
                            ),
                            const SizedBox(
                              height: AppSize.s40,
                            ),
                            Text(
                              AppStrings.loginPhrase,
                              style: TextStyle(color: ColorManager.darkPrimary),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: SizedBox(
                          height: height,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: height / 2.0,
                                margin: const EdgeInsets.all(40),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 30
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(32),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black45,
                                          blurRadius: 10.0,
                                          spreadRadius: 5.0,
                                          offset: Offset(0.0,0.0)
                                      ),
                                    ]
                                ),
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        AppStrings.login,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            ?.copyWith(color: ColorManager.primary),
                                      ),
                                      const SizedBox(
                                        height: 30.0,
                                      ),
                                      defaultFormField(
                                        controller: passwordController,
                                        type: TextInputType.visiblePassword,
                                        validate: (value) {
                                          if (value.isEmpty) {
                                            return AppStrings.passwordHint;
                                          }
                                          return null;
                                        },
                                        label: AppStrings.code,
                                        prefix: Icons.lock_outline,
                                        isPassword: LoginCubit.get(context).isPassword,
                                        suffix: LoginCubit.get(context).suffix,
                                        suffixPressed: () {
                                          LoginCubit.get(context).changePasswordVisibility();
                                        },
                                        onSubmit: (value) {
                                          if (formKey.currentState!.validate()) {
                                            LoginCubit.get(context).userLogin(
                                                email: emailController.text,
                                                password:
                                                passwordController.text);
                                          }
                                        },
                                      ),
                                      const SizedBox(
                                        height: 40.0,
                                      ),
                                      ConditionalBuilder(
                                        condition: state is! LoginLoadingState,
                                        builder: (context) => Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(30.0),
                                            color: ColorManager.primary,
                                          ),
                                          child: MaterialButton(
                                            onPressed: () {
                                              if (formKey.currentState!.validate())
                                              {
                                                Navigator.pushReplacementNamed(context, Routes.layoutRoute);
                                                LoginCubit.get(context).userLogin(
                                                    email:
                                                    emailController.text,
                                                    password:
                                                    passwordController.text
                                                );
                                              }
                                            },
                                            child: const Text(
                                              AppStrings.login,
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),

                                        ),
                                        fallback: (context) => const Center(
                                            child: CircularProgressIndicator()),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
