part of 'movie_bloc.dart';

@immutable
abstract class MovieState {}

class MovieInitial extends MovieState {}
class MovieblocLoading extends MovieState {}
class MovieblocLoaded extends MovieState {}
class MovieblocError extends MovieState{}