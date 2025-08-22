import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'section_naming_event.dart';
part 'section_naming_state.dart';

class SectionNamingBloc extends Bloc<SectionNamingEvent, SectionNamingState> {
  SectionNamingBloc() : super(SectionNamingInitial()) {
    on<ScrollMoving>((event, emit) {
      if (event.position >= 0.5 && event.position <= 3) {
        emit(
          SectionNamingLoaded(
            name: "Hobbies",
            isMainPage: event.position >= 0.5 && event.position <= 1.5,
          ),
        );
      } else if (event.position >= 3.5 && event.position <= 7) {
        emit(
          SectionNamingLoaded(
            name: "Expertise",
            isMainPage: event.position >= 3.5 && event.position <= 4.5,
          ),
        );
      } 
      
      // else if (event.position >= 7.5 && event.position <= 10) {
      //   emit(
      //     SectionNamingLoaded(
      //       name: "Experience",
      //       isMainPage: event.position >= 7.5 && event.position <= 10,
      //     ),
      //   );
      // }
      
       else if (event.position < 0.5 || event.position >= 8) {
        emit(SectionNamingInitial());
      }

      //  else {
      //   emit(SectionNamingInitial());
      // }
    });
  }
}
