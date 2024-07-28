import 'package:atmata/presentation/resources/color_manager.dart';
import 'package:atmata/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '../presentation/resources/routes_manager.dart';

class SubjectCard extends StatelessWidget {
  String? subject;
  String? imageUrl;
  Color? color;

  SubjectCard({this.subject, this.imageUrl}) {
    switch (subject) {
      case 'Math':
        imageUrl = 'assets/icons/subjects/math.png';
        color = Colors.lightGreen;
        break;
      case 'Science':
        imageUrl = 'assets/icons/subjects/science.png';
        color = Colors.orangeAccent;
        break;
      case 'Physics':
        imageUrl = 'assets/icons/subjects/test.png';
        color = Colors.teal;
        break;
      case 'Arabic':
        imageUrl = 'assets/icons/subjects/arabic.png';
        color = Colors.grey;
        break;
      case 'English':
        imageUrl = 'assets/icons/subjects/linguistics.png';
        color = Colors.red;
        break;
      case 'Geography':
        imageUrl = 'assets/icons/subjects/geo.png';
        color = Colors.blueAccent;
        break;
      case 'Music':
        imageUrl = 'assets/icons/subjects/music.png';
        color = Colors.pinkAccent;
        break;
      case 'Sport':
        imageUrl = 'assets/icons/subjects/sports.png';
        color = Colors.yellow;
        break;
      default:
        imageUrl = imageUrl;
        color = Colors.purpleAccent;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(context, Routes.quizRoute);
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: AppHeight.h80,
              margin: const EdgeInsets.all(AppMargin.m8),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("$imageUrl"), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(AppSize.s16),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                        blurRadius: AppSize.s20) //blur radius of shadow
                  ]),
            ),
            Container(
              width: double.infinity,
              height: AppHeight.h80,
              margin: const EdgeInsets.all(AppMargin.m8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s16),
                  color: ColorManager.primary.withOpacity(0.6),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.2),
                        blurRadius: AppSize.s10) //blur radius of shadow
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p12),
                child: Center(
                  child: Text("$subject",
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            color: ColorManager.white,
                          )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
