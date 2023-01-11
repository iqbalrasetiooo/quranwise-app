part of 'surah_bloc.dart';

abstract class SurahState extends Equatable {
  const SurahState();

  @override
  List<Object> get props => [];
}

class SurahInitial extends SurahState {}

class SurahLoading extends SurahState {}

class SurahSuccess extends SurahState {
  final List<SurahModel> data;
  const SurahSuccess({required this.data});
}

class SurahError extends SurahState {
  final String? message;
  const SurahError(this.message);
}
