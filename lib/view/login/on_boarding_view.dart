import 'package:fitness/common/color_extension.dart';
import 'package:fitness/view/login/signup_page.dart';
import 'package:fitness/view/login/step1_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../common_widget/round_button.dart';

class OneBoardingView extends StatefulWidget {
  const OneBoardingView({super.key});

  @override
  State<OneBoardingView> createState() => _OneBoardingViewState();
}

class _OneBoardingViewState extends State<OneBoardingView> {
  PageController? constroller = PageController();

  int selectPage = 0;

  List pageArray = [
    {
      "title": "Have a good health",
      "subtitle":
          "Beging heathy is all, no health is noting .\n So why do not we",
      "Image": "assets/img/on_board_1.png",
    },
    {
      "title": "Be Stronger",
      "subtitle":
          "Take 30 minutes of bodybuilding every day\n to get physically fit and healthy.",
      "Image": "assets/img/on_board_2.png",
    },
    {
      "title": "Have nice body",
      "subtitle":
          "bad body shape,poor sleep,lack of strength,\n weight gain,weak bones,easily traumtized\n body,depressed,stressed,poor metabolism,\n poor resistance.",
      "Image": "assets/img/on_board_3.png",
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    constroller?.addListener(() {
      selectPage = constroller?.page?.round() ?? 0;

      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.primary,
      body: Stack(
        children: [
          Image.asset(
            'assets/img/on_board_bg.png',
            width: media.width,
            height: media.height,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: PageView.builder(
                controller: constroller,
                itemCount: pageArray.length,
                itemBuilder: (context, index) {
                  var pObj = pageArray[index] as Map ?? {};
                  return Column(
                    children: [
                      Text(
                        pObj["title"].toString(),
                        style: TextStyle(
                            color: TColor.primary,
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: media.width * 0.25,
                      ),
                      Image.asset(
                        pObj["Image"].toString(),
                        width: media.width * 0.8,
                        height: media.width * 0.8,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        height: media.width * 0.25,
                      ),
                      Text(
                        pObj["subtitle"].toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: TColor.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  );
                }),
          ),
          SafeArea(
            child: Column(
              children: [
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: pageArray.map((pObj) {
                    var index = pageArray.indexOf(pObj);
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: selectPage == index
                            ? TColor.white
                            : TColor.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    );
                  }).toList(),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: RoundButton(
                    title: "Start",
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                          (route) => false);
                    },
                    type: RoundButtonType.primayText,
                  ),
                ),
                SizedBox(
                  height: media.width * 0.07,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
