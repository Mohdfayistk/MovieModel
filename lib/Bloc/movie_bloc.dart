import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Repository/api/api.dart';
import '../Repository/modelclass/MovieModel.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  late MovieModel animeModel;
  MovieApi animeApi=MovieApi();
  MovieBloc() : super(MovieInitial()) {
    on<FetchMovie>((event, emit)async {
      emit(MovieblocLoading());
      try{

        animeModel = await animeApi.getMovie();
        emit(MovieblocLoaded());
      } catch(e){
        print(e);
        emit(MovieblocError());}
    });
  }
}
