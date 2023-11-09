import 'package:employee_project/presentation/widgets/color/my_color.dart';
import 'package:employee_project/utils/constant.dart';
import 'package:flutter/material.dart';

class MyTypography extends StatelessWidget {
  final String text;
  final bool title;
  final MySystem? mySystem;

  const MyTypography(
      {super.key, required this.title, required this.text, this.mySystem});

  @override
  Widget build(BuildContext context) {

    Color color;

    if (title == true) {
      if (mySystem == MySystem.information) {
        color = MyColor.systemBlue;
      } else if (mySystem == MySystem.error) {
        color = MyColor.systemRed;
      } else if (mySystem == MySystem.warning) {
        color = MyColor.systemYellow;
      } else if (mySystem == MySystem.success) {
        color = MyColor.systemGreen;
      } else {
        color = MyColor.primaryColor;
      }
    } else {
      if (mySystem != null) {
        color = MyColor.black;
      } else {
        color = MyColor.secondaryColor;
      }
    }

    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontWeight: title == true ? FontWeight.bold : FontWeight.normal,
        fontSize: title == true ? 20 : 14,
      ),
    );
  }
}
