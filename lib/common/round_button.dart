import 'package:fitness/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const RoundButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        textColor: TColor.primary,
        color: TColor.white,
        height: 50,
        minWidth: double.maxFinite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Text(
          title,
          style: TextStyle(
              color: TColor.primary, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        onPressed: onPressed);
  }
}
