import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyandono/colors/colors.dart';
import 'package:fyandono/sections/contact/contact.dart';
import 'package:fyandono/sections/hero/hero.dart';
import 'package:fyandono/sections/hobbies/piano.dart';
import 'package:fyandono/sections/hobbies/swimming.dart';
import 'package:fyandono/sections/hobbies/hobbies_widget.dart';
import 'package:fyandono/sections/tech_stack/tech_stack.dart';
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
          // controller: mainController,
          hitTestBehavior: HitTestBehavior.deferToChild,
          scrollBehavior: CupertinoScrollBehavior(),
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

            // SKILLS
            SectionWidget(
              child: MyText(
                text: "Skills",
                fontSize: isMobile(context) ? 48 : 72,
                color: AppColors.grey1000,
              ),
            ),

            SectionWidget(
              child: TechCategoryWidget(
                categoryName: "Mobile Development",
                items: [
                  TechItem(
                    name: "Flutter",
                    logoAsset: "assets/logo/flutter.png",
                  ),
                  TechItem(
                    name: "React Native",
                    logoAsset: "assets/logo/react_native.png",
                  ),
                  TechItem(name: "Swift", logoAsset: "assets/logo/swift.png"),
                  TechItem(name: "Kotlin", logoAsset: "assets/logo/kotlin.png"),
                ],
              ),
            ),
            SectionWidget(
              child: TechCategoryWidget(
                categoryName: "Backend Development",
                items: [
                  TechItem(
                    name: "Java Spring",
                    logoAsset: "assets/logo/spring.png",
                  ),
                  TechItem(
                    name: "Java Quarkus",
                    logoAsset: "assets/logo/quarkus.png",
                  ),
                  TechItem(
                    name: "Rust Actix",
                    logoAsset: "assets/logo/rust.png",
                  ),
                  TechItem(
                    name: "Python Flask",
                    logoAsset: "assets/logo/flask.png",
                  ),
                  TechItem(
                    name: "Python Django",
                    logoAsset: "assets/logo/django.png",
                  ),
                ],
              ),
            ),

            SectionWidget(
              child: TechCategoryWidget(
                categoryName: "Database",
                items: [
                  TechItem(
                    name: "PostgreSQL",
                    logoAsset: "assets/logo/postgresql.png",
                  ),
                  TechItem(
                    name: "MongoDB",
                    logoAsset: "assets/logo/mongodb.png",
                  ),
                ],
              ),
            ),

            // EXPERIENCES
            SectionWidget(
              child: MyText(
                text: "Experiences",
                fontSize: isMobile(context) ? 48 : 72,
                color: AppColors.grey1000,
              ),
            ),

            // CONTACT
            SectionWidget(child: ContactSection()),
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
