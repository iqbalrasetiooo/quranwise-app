import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'detail_surah_event.dart';
part 'detail_surah_state.dart';

class DetailSurahBloc extends Bloc<DetailSurahEvent, DetailSurahState> {
  DetailSurahBloc() : super(DetailSurahInitial()) {
    on<DetailSurahEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
