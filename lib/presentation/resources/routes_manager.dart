import 'package:atmata/layout/home_layout/home_layout.dart';
import 'package:atmata/presentation/quiz/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:atmata/presentation/login/login.dart';
import 'package:atmata/presentation/onboarding/view/onboarding_view.dart';
import 'package:atmata/presentation/resources/strings_manager.dart';
import 'package:atmata/presentation/splash/splash_view.dart';

import '../home/home_screen.dart';


class Routes{
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String layoutRoute = "/layout";
  static const String homeRoute = "/home";
  static const String quizRoute = "/quiz";

}
class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings routeSettings){
    switch (routeSettings.name){
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_)=>const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_)=>const OnBoardingView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_)=> LoginScreen());
      case Routes.layoutRoute:
        return MaterialPageRoute(builder: (_)=> HomeLayout());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_)=> HomeScreen());
      case Routes.quizRoute:
        return MaterialPageRoute(builder: (_)=> const QuizScreen());
      default:
        return unDefinedRoute();
    }
  }
  static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(builder: (_)=>
    Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.noRouteFound),
      ),
      body: const Center(child: Text(AppStrings.noRouteFound)),
    )
    );
  }
}