part of 'fade_text_bloc.dart';

sealed class FadeTextState extends Equatable {
  const FadeTextState();

  @override
  List<Object> get props => [];
}

final class FadeTextInitial extends FadeTextState {}

final class FadeTextVisible extends FadeTextState {
  final String text;
  const FadeTextVisible({required this.text});

  @override
  List<Object> get props => [text];
}

final class FadeTextHidden extends FadeTextState {}
