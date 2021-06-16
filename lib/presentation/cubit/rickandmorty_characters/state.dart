part of 'cubit.dart';

abstract class RickandmortyCharactersState extends Equatable {
  const RickandmortyCharactersState();

  @override
  List<Object> get props => [];
}

class RickandmortyCharactersInitial extends RickandmortyCharactersState {}

class RickandmortyCharactersLoading extends RickandmortyCharactersState {}

class RickandmortyCharactersLoaded extends RickandmortyCharactersState {
  final RickAndMortyApi rickAndMortyApi;

  RickandmortyCharactersLoaded(this.rickAndMortyApi);

  @override
  List<Object> get props => [rickAndMortyApi];
}

class RickandmortyCharactersError extends RickandmortyCharactersState {
  final String message;

  RickandmortyCharactersError(this.message);

  @override
  List<Object> get props => [message];
}
