import 'package:fitness/common/color_extension.dart';
import 'package:fitness/view/login/step2_view.dart';
import 'package:flutter/material.dart';

import '../../common_widget/round_button.dart';

class Step1View extends StatefulWidget {
  const Step1View({super.key});

  @override
  State<Step1View> createState() => _Step1ViewState();
}

class _Step1ViewState extends State<Step1View> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Text(
            "Step 1 of 3",
            style: TextStyle(
                color: TColor.primary,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
          const Spacer(),
          Image.asset(
            "assets/img/step_1.png",
            width: media.width * 0.6,
            height: media.width * 0.6,
            fit: BoxFit.contain,
          ),
          //PulsePeak Fitness
          Text(
            "Step 1 of 3",
            style: TextStyle(
                color: TColor.primary,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Text(
              "WelCome to \nPulsePeak Fitness Application",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 25,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Text(
            "Personalized workouts will help you \n gain strength, get in better shape and \n embrace a healthy lifestyle,",
            style: TextStyle(
                color: TColor.secondaryText,
                fontSize: 16,
                fontWeight: FontWeight.w300),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: RoundButton(
              title: "Get Started",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Step2View()));
              },
            ),
          ),
          SizedBox(
            height: media.width * 0.07,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [1, 2, 3].map((pObj) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color:
                      1 == pObj ? TColor.primary : TColor.gray.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(6),
                ),
              );
            }).toList(),
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    ));
  }
}
