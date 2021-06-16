import 'package:dartz/dartz.dart';
import 'package:ecommers_app/core/errors/failure.dart';
import 'package:ecommers_app/data/models/rickandmortyapi_model.dart';
import 'package:ecommers_app/domain/repositories/rickandmorty_remote_reposiroty.dart';

class RickAndMortyCharacters {
  final RickAndMortyApiRemoteRepository rickAndMortyApiRemoteRepository;

  RickAndMortyCharacters(this.rickAndMortyApiRemoteRepository);

  Future<Either<Failure, RickAndMortyApi>> call() async {
    return rickAndMortyApiRemoteRepository.getCharacters();
  }
}
