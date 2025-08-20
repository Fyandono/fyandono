import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyandono/colors/colors.dart';
import 'package:fyandono/main.dart';
import 'package:fyandono/widgets/fade_text/bloc/fade_text_bloc.dart';
import 'package:fyandono/widgets/fade_text/fade_in_text.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => FadeTextBloc(
            fadeDuration: Duration(milliseconds: 150),
            texts: [
              "I AM",
              "RIVA ALIFYANDONO",
              "SOFTWARE ENGINEER",
              "I WRITE CODES!",
              "SCROLL FOR MORE!",
            ],
          )..add(StartFade()),
      child: FadeTextWidget(
        fontSize: isMobile(context) ? 48 : 72,
        fontWeight: FontWeight.w500,
        color: AppColors.grey1000,
      ),
    );
  }
}
