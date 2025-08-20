import 'package:flutter/material.dart';
import 'package:fyandono/colors/colors.dart';
import 'package:fyandono/sections/hero/hero.dart';
import 'package:fyandono/sections/hobbies/piano.dart';
import 'package:fyandono/sections/hobbies/swimming.dart';
import 'package:fyandono/sections/hobbies/hobbies_widget.dart';
import 'package:fyandono/widgets/text.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PageView(
          scrollDirection: Axis.vertical,
          children: [

            // HERO
            SectionWidget(child: HeroWidget()),

            // HOBBIES
            SectionWidget(
              child: MyText(
                text: "Hobbies",
                fontSize: isMobile(context) ? 48 : 72,
                color: AppColors.grey1000,
              ),
            ),

            SectionWidget(
              child: HobbiesWidget(
                title: "Music",
                hobby: PianoWidget(),
                texts: [
                  "press the keys to play",
                  "i play music sometimes",
                  "every note tells a story",
                  "try your favorite tune!",
                ],
              ),
            ),

            SectionWidget(
              child: HobbiesWidget(
                title: "Swimming",
                hobby: SwimmingWidget(),
                texts: [
                  "i love swimming in my free time",
                  "glide through the water",
                  "building strength and endurance",
                  "relax and float away",
                ],
              ),
            ),
            // SwimmingWidget(),
          ],
        ),
      ),
    );
  }
}

class SectionWidget extends StatelessWidget {
  final Widget child;
  const SectionWidget({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      child: child,
    );
  }
}

bool isMobile(BuildContext context) {
  final size = MediaQuery.of(context).size;
  // You can adjust the breakpoint as needed
  return size.shortestSide < 600; // phones usually < 600dp
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: "RIVA ALIFYANDONO",
            fontSize: isMobile(context) ? 64 : 84,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
