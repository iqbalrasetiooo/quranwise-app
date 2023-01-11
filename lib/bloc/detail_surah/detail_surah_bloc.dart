import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quranwise/models/detail_surah_model.dart';

import '../../api_service.dart';

part 'detail_surah_event.dart';
part 'detail_surah_state.dart';

class DetailSurahBloc extends Bloc<DetailSurahEvent, DetailSurahState> {
  DetailSurahBloc() : super(DetailSurahInitial()) {
    on<GetDetailSurahEvent>((event, emit) async {
      // TODO: implement event handler
      try {
        emit(DetailSurahLoading());
        var json = await ApiService().getDetailSurah(id: event.id);
        var data = DetailSurahModel.fromJson(json);
        emit(DetailSurahSuccess(data: data));
      } catch (e) {
        emit(DetailSurahError(e.toString()));
      }
    });
  }
}
