import 'package:dartz/dartz.dart';
import 'package:ecommers_app/core/errors/failure.dart';
import 'package:ecommers_app/data/models/rickandmortyapi_model.dart';

abstract class RickAndMortyApiRemoteRepository {
  Future<Either<Failure, RickAndMortyApi>> getCharacters();
}
