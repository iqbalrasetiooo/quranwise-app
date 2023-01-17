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
        var data = await ApiService().getDetailSurah(id: event.id);
        var json = DetailSurahModel.fromJson(data);
        print(json);
        emit(DetailSurahSuccess(data: json));
      } catch (e) {
        print(e);
        throw Exception(e);
        // emit(DetailSurahError(e.toString()));
      }
    });
  }
}
