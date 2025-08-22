part of 'section_naming_bloc.dart';

sealed class SectionNamingEvent extends Equatable {
  const SectionNamingEvent();

  @override
  List<Object> get props => [];
}

final class ChangePage extends SectionNamingEvent {
  final int index;
  const ChangePage({required this.index});

  @override
  List<Object> get props => [index];
}

final class ScrollMoving extends SectionNamingEvent {
  final double position;
  const ScrollMoving({required this.position});

  @override
  List<Object> get props => [position];
}
