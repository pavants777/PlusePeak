import 'dart:ui';

import 'package:fitness/common/color_extension.dart';
import 'package:fitness/common_widget/menu_call.dart';
import 'package:fitness/common_widget/plan_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MenuView extends StatefulWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List planArr = [
    {
      "name": "Running",
      "icon": "assets/img/menu_running.png",
      "right_icon": "",
    },
    {
      "name": "Yoga",
      "icon": "assets/img/yoga.png",
      "right_icon": "assets/img/information.png",
    },
    {
      "name": "Workout",
      "icon": "assets/img/workout.png",
      "right_icon": "",
    },
    {
      "name": "Walking",
      "icon": "assets/img/walking.png",
      "right_icon": "",
    },
    {
      "name": "Fitness",
      "icon": "assets/img/fitness.png",
      "right_icon": "assets/img/information.png",
    },
    {
      "name": "Strength",
      "icon": "assets/img/strength.png",
      "right_icon": "",
    }
  ];

  List menuArr = [
    {"name": "Home", "image": "assets/img/menu_home.png", "tag": "1"},
    {"name": "Weight", "image": "assets/img/menu_weight.png", "tag": "2"},
    {
      "name": "Traning plan",
      "image": "assets/img/menu_traning_plan.png",
      "tag": "3"
    },
    {
      "name": "Training Status",
      "image": "assets/img/menu_traning_status.png",
      "tag": "4"
    },
    {"name": "Meal Plan", "image": "assets/img/menu_meal_plan.png", "tag": "5"},
    {"name": "Schedule", "image": "assets/img/menu_schedule.png", "tag": "6"},
    {"name": "Running", "image": "assets/img/menu_running.png", "tag": "7"},
    {"name": "Exercises", "image": "assets/img/menu_exercises.png", "tag": "8"},
    {"name": "Tips", "image": "assets/img/menu_tips.png", "tag": "9"},
    {"name": "Settings", "image": "assets/img/menu_settings.png", "tag": "10"},
    {"name": "Support", "image": "assets/img/menu_support.png", "tag": "11"},
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        width: media.width,
        backgroundColor: Colors.transparent,
        child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5.0,
              sigmaY: 5,
            ),
            child: Stack(children: [
              SizedBox(
                height: media.width * 1,
              ),
              Container(
                width: media.width * 0.78,
                decoration: BoxDecoration(color: TColor.white),
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(45),
                    child: Column(
                      children: [
                        Container(
                          height: kTextTabBarHeight,
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(22.5),
                                child: Image.asset(
                                  "assets/img/u1.png",
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Text(
                                  "User Name",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: TColor.secondaryText,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        const Divider(
                          color: Colors.black26,
                          height: 1,
                        ),
                        Expanded(
                            child: ListView.builder(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 50),
                                itemCount: planArr.length,
                                itemBuilder: (context, index) {
                                  var itemObj = planArr[index] as Map? ?? {};

                                  return PlanRow(
                                    mObj: itemObj,
                                    onPressed: () {
                                      // Navigator.pop(context);
                                      if (index == 1) {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             const YogaView()));
                                      }
                                    },
                                  );
                                })),
                        const Divider(
                          color: Colors.black26,
                          height: 1,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: kTextTabBarHeight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Switch Account",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: TColor.secondaryText,
                                    fontWeight: FontWeight.w700),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Image.asset("assets/img/next.png",
                                    width: 18, height: 18),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ])),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.black,
              expandedHeight: media.width * 0.8,
              collapsedHeight: kToolbarHeight + 100,
              pinned: true,
              flexibleSpace: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image.asset(
                    "assets/img/1.png",
                    width: media.width,
                    height: media.width * 0.8,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: media.width,
                    height: media.width * 0.8,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.transparent, Colors.black],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 30),
                    child: Row(
                      children: [
                        Container(
                          width: 54,
                          height: 54,
                          decoration: BoxDecoration(
                            color: TColor.white,
                            borderRadius: BorderRadius.circular(27),
                          ),
                          alignment: Alignment.center,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.asset(
                              "assets/img/u1.png",
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "User Name",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: TColor.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "Profile",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: TColor.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ];
        },
        body: GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 1),
          itemCount: menuArr.length,
          itemBuilder: ((context, index) {
            var mObj = menuArr[index] as Map? ?? {};
            return MenuCell(
              mObj: mObj,
              onPressed: () {
                switch (mObj["tag"].toString()) {
                  case "1":
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const HomeView()));
                    break;
                  case "2":
                    //  Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const WeightView()));
                    break;
                  case "3":
                    Scaffold.of(context).openDrawer();
                    break;
                  case "5":
                    //  Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const MealPlanView2()));
                    break;
                  case "6":
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const ScheduleView()));
                    break;
                  case "7":
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const RunningView()));
                    break;
                  case "8":
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const ExerciseView2()));
                    break;
                  case "9":
                    // Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => const TipsView()));
                    break;
                  case "10":
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const SettingsView()));
                    break;
                  default:
                }
              },
            );
          }),
        ),
      ),
    );
  }
}
