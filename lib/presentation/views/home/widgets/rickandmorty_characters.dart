import 'package:ecommers_app/data/models/rickandmortyapi_model.dart';
import 'package:ecommers_app/presentation/views/home/widgets/characters_card.dart';
import 'package:flutter/material.dart';

class RickAndMortyCharacters extends StatelessWidget {
  final RickAndMortyApi rickAndMortyApi;

  const RickAndMortyCharacters({Key? key, required this.rickAndMortyApi})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          width: double.infinity,
          height: double.infinity,
          child: _buildListView())
    ]);
  }

  ListView _buildListView() {
    return ListView.separated(
      itemCount: rickAndMortyApi.results.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (context, index) {
        return CharactersCard(
          gender: rickAndMortyApi.results[index].gender,
          image: rickAndMortyApi.results[index].image,
          name: rickAndMortyApi.results[index].name,
          species: rickAndMortyApi.results[index].species,
          status: rickAndMortyApi.results[index].status,
          index: index,
          rickAndMortyApi: rickAndMortyApi,
        );
      },
    );
  }
}
