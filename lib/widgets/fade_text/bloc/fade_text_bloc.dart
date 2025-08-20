import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fade_text_event.dart';
part 'fade_text_state.dart';

class FadeTextBloc extends Bloc<FadeTextEvent, FadeTextState> {
  final List<String> texts;
  final Duration durationPerText;
  Duration fadeDuration;
  int _currentIndex = 0;

  FadeTextBloc({
    required this.texts,
    this.durationPerText = const Duration(seconds: 3),
    this.fadeDuration = const Duration(milliseconds: 500),
  }) : super(FadeTextInitial()) {
    on<StartFade>((event, emit) async {
      while (true) {
        if (!isClosed) emit(FadeTextVisible(text: texts[_currentIndex]));
        await Future.delayed(durationPerText);

        if (!isClosed) emit(FadeTextHidden());
        await Future.delayed(fadeDuration);
        _currentIndex = (_currentIndex + 1) % texts.length;
      }
    });

    on<NextText>((event, emit) async {
      emit(FadeTextHidden());
      await Future.delayed(fadeDuration);

      _currentIndex = (_currentIndex + 1) % texts.length;
      emit(FadeTextVisible(text: texts[_currentIndex]));
    });
  }
}
