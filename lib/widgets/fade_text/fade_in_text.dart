import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyandono/colors/colors.dart';
import 'package:fyandono/widgets/fade_text/bloc/fade_text_bloc.dart';
import 'package:fyandono/widgets/text.dart';

class FadeTextWidget extends StatelessWidget {
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  const FadeTextWidget({
    this.fontSize = 24,
    this.fontWeight = FontWeight.w400,
    this.color = AppColors.grey800,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final fadeDuration = context.read<FadeTextBloc>().fadeDuration;

    return BlocBuilder<FadeTextBloc, FadeTextState>(
      builder: (context, state) {
        String currentText = '';

        if (state is FadeTextVisible) {
          currentText = state.text;
        }

        return AnimatedSwitcher(
          duration: fadeDuration,
          transitionBuilder: (child, animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: MyText(
            key: ValueKey(currentText),
            text: currentText,
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
