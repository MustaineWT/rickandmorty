import 'package:dartz/dartz.dart';
import 'package:ecommers_app/core/errors/exceptions.dart';
import 'package:ecommers_app/core/errors/failure.dart';
import 'package:ecommers_app/data/datasources/remote/rickandmortyapi_remote.dart';
import 'package:ecommers_app/data/models/rickandmortyapi_model.dart';
import 'package:ecommers_app/domain/repositories/rickandmorty_remote_reposiroty.dart';

class RickAndMortyApiRemoteRepositoryImpl
    implements RickAndMortyApiRemoteRepository {
  final RickAndMortyApuRemoteDataSources rickAndMortyApiRemoteDataSources;

  RickAndMortyApiRemoteRepositoryImpl(this.rickAndMortyApiRemoteDataSources);

  @override
  Future<Either<Failure, RickAndMortyApi>> getCharacters() async {
    try {
      final response =
          await rickAndMortyApiRemoteDataSources.requestCharacters();
      return Right(response);
    } on ServerException {
      return Left(
        ServerFailure(
            message: 'Ha ocurrido un error al obtener los datos del servidor'),
      );
    }
  }
}
