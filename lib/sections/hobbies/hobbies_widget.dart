import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyandono/widgets/fade_text/bloc/fade_text_bloc.dart';
import 'package:fyandono/widgets/fade_text/fade_in_text.dart';
import 'package:fyandono/widgets/text.dart';

class HobbiesWidget extends StatelessWidget {
  final String title;
  final Widget hobby;
  final List<String> texts;
  const HobbiesWidget({
    required this.title,
    required this.hobby,
    required this.texts,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyText(text: title, fontSize: 32),
        SizedBox(height: 24),
        hobby,
        SizedBox(height: 28),
        BlocProvider(
          create: (context) => FadeTextBloc(texts: texts)..add(StartFade()),
          child: FadeTextWidget(),
        ),
      ],
    );
  }
}
