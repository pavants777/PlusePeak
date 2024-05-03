import 'package:fitness/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

enum RoundButtonType { primary, primayText }

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final RoundButtonType type;
  const RoundButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.type = RoundButtonType.primary});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        textColor:
            type == RoundButtonType.primary ? TColor.white : TColor.primary,
        color: type == RoundButtonType.primary ? TColor.primary : TColor.white,
        height: 50,
        minWidth: double.maxFinite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Text(
          title,
          style: TextStyle(
              color: type == RoundButtonType.primary
                  ? TColor.white
                  : TColor.primary,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
        onPressed: onPressed);
  }
}
