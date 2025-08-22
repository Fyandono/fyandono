part of 'section_naming_bloc.dart';

sealed class SectionNamingState extends Equatable {
  const SectionNamingState();

  @override
  List<Object> get props => [];
}

final class SectionNamingInitial extends SectionNamingState {}

final class SectionNamingLoaded extends SectionNamingState {
  final String name;
  final bool isMainPage;
  const SectionNamingLoaded({required this.name, required this.isMainPage});

  @override
  List<Object> get props => [name, isMainPage];
}
