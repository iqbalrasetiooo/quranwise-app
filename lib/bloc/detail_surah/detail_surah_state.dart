part of 'detail_surah_bloc.dart';

abstract class DetailSurahState extends Equatable {
  const DetailSurahState();

  @override
  List<Object> get props => [];
}

class DetailSurahInitial extends DetailSurahState {}

class DetailSurahLoading extends DetailSurahState {}

class DetailSurahSuccess extends DetailSurahState {
  final List<DetailSurahModel> data;
  const DetailSurahSuccess({required this.data});
}

class DetailSurahError extends DetailSurahState {
  final String? message;
  const DetailSurahError(this.message);
}
