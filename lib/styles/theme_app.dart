import 'package:flutter/material.dart';

// class ThemeAppd {
//   final ThemeModel themeModel;
//   static Color primaryColor = const Color(0xFF6C92EF);
//   static Color onPrimaryColor = const Color(0xFFFFFFFF);
//   static Color secondaryColor = const Color(0xFF162F68);
//   static Color errorColor = const Color(0xFFFF0000);
//   static Color borderColor = const Color(0xFFC5C5C5);
//   static  TextStyle  buttonTextStyle= const TextStyle(
//       fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xFFFFFFFF));
//   static  TextStyle  headline1= const TextStyle(
//       fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xFF000000));
//   static  TextStyle  headline2= const TextStyle(
//       fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xFF000000));
//   static  TextStyle  hintStyle= const TextStyle(
//       fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xFF858585));

//   ThemeAppd(this.themeModel) {
//     primaryColor=Color(int.parse("0xff${themeModel.primaryColor}"));
//     onPrimaryColor=Color(int.parse("0xff${themeModel.onPrimaryColor}"));
//     secondaryColor=Color(int.parse("0xff${themeModel.secondaryColor}"));
//     errorColor=Color(int.parse("0xff${themeModel.errorColor}"));
//     borderColor=Color(int.parse("0xff${themeModel.borderColor}"));
//     buttonTextStyle= TextStyle(
//       fontWeight: themeModel.buttonTextStyle.fontWeight == "bold"
//           ? FontWeight.bold
//           : themeModel.buttonTextStyle.fontWeight == "w400"
//           ? FontWeight.w400
//           : FontWeight.w500,
//       fontSize: themeModel.buttonTextStyle.fontSize,
//       color:
//       Color(int.parse("0xff${themeModel.buttonTextStyle.color}")),
//     );
//     headline1= TextStyle(
//       fontWeight: themeModel.headline1.fontWeight == "bold"
//           ? FontWeight.bold
//           : themeModel.headline1.fontWeight == "w400"
//           ? FontWeight.w400
//           : FontWeight.w500,
//       fontSize: themeModel.headline1.fontSize,
//       color:
//       Color(int.parse("0xff${themeModel.headline1.color}")),
//     );
//     headline2= TextStyle(
//       fontWeight: themeModel.headline2.fontWeight == "bold"
//           ? FontWeight.bold
//           : themeModel.headline2.fontWeight == "w400"
//           ? FontWeight.w400
//           : FontWeight.w500,
//       fontSize: themeModel.headline2.fontSize,
//       color:
//       Color(int.parse("0xff${themeModel.headline2.color}")),
//     );
//     hintStyle= TextStyle(
//       fontWeight: themeModel.hintStyle.fontWeight == "bold"
//           ? FontWeight.bold
//           : themeModel.hintStyle.fontWeight == "w400"
//           ? FontWeight.w400
//           : FontWeight.w500,
//       fontSize: themeModel.hintStyle.fontSize,
//       color:
//       Color(int.parse("0xff${themeModel.hintStyle.color}")),
//     );
//   }
// }

ThemeModel? ThemeApp;
class ThemeModel {
  Color primaryColor;
  Color onPrimaryColor;
  Color secondaryColor;
  Color  errorColor;
  Color borderColor;
  TextStyle buttonTextStyle;
  TextStyle headline1;
  TextStyle headline2;
  TextStyle hintStyle;


  ThemeModel(
      {required this.primaryColor,
      required this.onPrimaryColor,
        required  this.secondaryColor,
        required  this.errorColor,
        required this.borderColor,
        required this.buttonTextStyle,
        required this.headline1,
        required this.headline2,
        required this.hintStyle});

  // factory ThemeModel.fromJson(Map<String, dynamic> json) {
  //   return ThemeModel(
  //       primaryColor: json["primaryColor"],
  //       onPrimaryColor: json["onPrimaryColor"],
  //       secondaryColor: json["secondaryColor"],
  //       errorColor: json["errorColor"],
  //       borderColor: json["borderColor"],
  //     //   buttonTextStyle: TextStyleModel.fromJson(json["buttonTextStyle"]),
  //     // headline1: TextStyle.fromJson(json["headline1"]),
  //     // headline2: TextStyleModel.fromJson(json["headline2"]),
  //     // hintStyle: TextStyleModel.fromJson(json["hintStyle"]),
  //   );
 // }
}
class TextStyleModel {
  String fontWeight;
  double fontSize;
  String color;

  TextStyleModel({
    required this.fontWeight,
    required this.fontSize,
    required this.color,
  });

  factory TextStyleModel.fromJson(Map<String, dynamic> json) {
    return TextStyleModel(
        fontWeight: json['fontWeight'],
        fontSize: double.parse(json['fontSize'].toString()),
        color: json['color']);
  }
}