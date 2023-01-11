part of 'detail_surah_bloc.dart';

abstract class DetailSurahEvent extends Equatable {
  const DetailSurahEvent();

  @override
  List<Object> get props => [];
}

class GetDetailSurahEvent extends DetailSurahEvent {
  final String id;
  const GetDetailSurahEvent({required this.id});
}
