import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommers_app/core/errors/failure.dart';
import 'package:ecommers_app/data/models/rickandmortyapi_model.dart';
import 'package:ecommers_app/domain/usecases/rickandmorty_api/rickandmorty_characters.dart';
import 'package:equatable/equatable.dart';

part 'state.dart';

class RickandmortyCharactersCubit extends Cubit<RickandmortyCharactersState> {
  final RickAndMortyCharacters rickAndMortyCharacters;
  RickandmortyCharactersCubit(this.rickAndMortyCharacters)
      : super(RickandmortyCharactersInitial());

  void getRickAndMortyCharacters() async {
    emit(RickandmortyCharactersLoading());
    final failureOrBook = await rickAndMortyCharacters();
    emit(_eitherLoadedOrErrorState(failureOrBook));
  }

  RickandmortyCharactersState _eitherLoadedOrErrorState(
      Either<Failure, RickAndMortyApi> failureOrPokemonList) {
    return failureOrPokemonList.fold(
        (failure) => RickandmortyCharactersError(_mapFailureToMessage(failure)),
        (characters) => RickandmortyCharactersLoaded(characters));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Ha ocurrido un error, por favor intenta nuevamente.';
      default:
        return 'Unexpected error';
    }
  }
}
