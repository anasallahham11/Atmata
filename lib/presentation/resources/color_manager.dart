import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:atmata/presentation/resources/values_manager.dart';

class ColorManager {
  static Color primary = const Color(0xff89CFF0);
  static Color darkGrey = const Color(0xff525252);
  static Color grey = const Color(0xff737477);
  static Color lightGrey = const Color(0xff9E9E9E);
  static Color primaryOpacity70 = const Color(0xB389CFF0);

  static Color darkPrimary = const Color(0xff0b1b24);
  static Color grey1 = const Color(0xff707070);
  static Color grey2 = const Color(0xff797979);
  static Color white = const Color(0xffffffff);
  static Color error = const Color(0xffe61f34);
  static Color wrong = const Color(0xffe52b50);
  static Color correct = Colors.lightGreen;

}

extension HexColor on Color{
  static Color fromHex(String hexColorString){
    hexColorString = hexColorString.replaceAll('#', '');
    if(hexColorString.length ==6){
      hexColorString = "FF$hexColorString";
    }
    return Color(int.parse(hexColorString,radix: 16));
  }
}

void showToast({required String? text, required ToastStates state}) =>
    Fluttertoast.showToast(
        msg: text!,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: AppSize.s16);

////

enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.orange.shade900;
      break;
  }
  return color;
}
