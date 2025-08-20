part of 'fade_text_bloc.dart';

sealed class FadeTextEvent extends Equatable {
  const FadeTextEvent();

  @override
  List<Object> get props => [];
}

class StartFade extends FadeTextEvent {}

class NextText extends FadeTextEvent {}
