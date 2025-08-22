import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyandono/colors/colors.dart';
import 'package:fyandono/sections/contact/contact.dart';
import 'package:fyandono/sections/hero/hero.dart';
import 'package:fyandono/sections/hobbies/piano.dart';
import 'package:fyandono/sections/hobbies/swimming.dart';
import 'package:fyandono/sections/hobbies/hobbies_widget.dart';
import 'package:fyandono/sections/section_naming/section_naming_bloc.dart';
import 'package:fyandono/sections/tech_stack/tech_stack.dart';
import 'package:fyandono/widgets/text.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    BlocProvider(
      create: (context) => SectionNamingBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final mainController = PageController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      mainController.position.isScrollingNotifier.addListener(() {
        if (mainController.position.isScrollingNotifier.value) {
          BlocProvider.of<SectionNamingBloc>(
            context,
          ).add(ScrollMoving(position: mainController.page ?? 0));
        } else {
          BlocProvider.of<SectionNamingBloc>(
            context,
          ).add(ScrollMoving(position: mainController.page ?? 0));
        }
      });
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: primarySwatch,
        primaryColor: AppColors.blueWater,
      ),
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  PageView(
                    controller: mainController,
                    scrollBehavior: CupertinoScrollBehavior(),
                    scrollDirection: Axis.vertical,
                    children: [
                      // HERO
                      // 0
                      SectionWidget(child: HeroWidget()),

                      // HOBBIES
                      // 1
                      SectionWidget(child: SizedBox.shrink()),

                      // 2
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

                      // 3
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
                      // 4
                      SectionWidget(child: SizedBox.shrink()),

                      // 5
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
                            TechItem(
                              name: "Swift",
                              logoAsset: "assets/logo/swift.png",
                            ),
                            TechItem(
                              name: "Kotlin",
                              logoAsset: "assets/logo/kotlin.png",
                            ),
                          ],
                        ),
                      ),

                      // 6
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

                      // 7
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
                      // SectionWidget(child: SizedBox.shrink()),

                      // CONTACT
                      // 8
                      SectionWidget(child: ContactSection()),
                    ],
                  ),
                  SectionTitle(),
                  // BlocBuilder<SectionNamingBloc, SectionNamingState>(
                  //   builder: (context, state) {
                  //     return Padding(
                  //       padding: const EdgeInsets.all(16),
                  //       child: AnimatedSwitcher(
                  //         duration: const Duration(milliseconds: 300),
                  //         transitionBuilder: (child, animation) {
                  //           return FadeTransition(
                  //             opacity: animation,
                  //             child: child,
                  //           );
                  //         },
                  //         child:
                  //             state is SectionNamingLoaded
                  //                 ? MyText(
                  //                   key: ValueKey(state.name),
                  //                   text: state.name,
                  //                   fontSize: 72,
                  //                   color: AppColors.grey200,
                  //                 )
                  //                 : const SizedBox(key: ValueKey('empty')),
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
            Container(
              width: double.maxFinite,
              color: AppColors.grey025,
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Center(
                child: MyText(
                  text: "© Riva Alifyandono",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey400,
                ),
              ),
            ),
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

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SectionNamingBloc, SectionNamingState>(
      builder: (context, state) {
        if (state is! SectionNamingLoaded) {
          return const SizedBox.shrink();
        }

        final isMainPage = state.isMainPage;
        final alignment = isMainPage ? Alignment.center : Alignment.topLeft;
        final fontSize = isMainPage ? 72.0 : 24.0;
        final padding = isMainPage ? EdgeInsets.zero : const EdgeInsets.all(16);
        final color = isMainPage ? AppColors.grey600 : AppColors.grey400;
        return AnimatedAlign(
          duration: const Duration(milliseconds: 600),
          curve: Curves.fastEaseInToSlowEaseOut,
          alignment: alignment,
          child: Padding(
            padding: padding,
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 600),
              curve: Curves.elasticInOut,
              style: TextStyle(fontSize: fontSize, color: color),
              child: MyText(text: state.name, fontSize: fontSize, color: color),
            ),
          ),
        );
      },
    );
  }
}
