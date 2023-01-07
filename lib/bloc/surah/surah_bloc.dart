import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../api_service.dart';
import '../../models/surah_model.dart';

part 'surah_event.dart';
part 'surah_state.dart';

class SurahBloc extends Bloc<SurahEvent, SurahState> {
  SurahBloc() : super(SurahInitial()) {
    on<SurahEvent>((event, emit) {
      on<GetAllSurahEvent>((event, emit) async {
        // TODO: implement event handler
        try {
          emit(SurahLoading());
          var data = await ApiService().getSurah();
          emit(SurahSuccess(data: data));
        } catch (e) {
          emit(SurahError(e.toString()));
        }
      });
    });
  }
}
