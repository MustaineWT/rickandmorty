import 'package:ecommers_app/data/models/rickandmortyapi_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DetailsBodyView extends StatelessWidget {
  const DetailsBodyView(
      {Key? key, required this.index, required this.rickAndMortyApi})
      : super(key: key);
  final int index;
  final RickAndMortyApi rickAndMortyApi;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/rick-and-morty-8.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 5),
          _buildCharacterImage(size),
          SizedBox(height: 10),
          _buildCharacterName(),
          SizedBox(height: 170),
          _buildCharacterLocation(),
          SizedBox(height: 10),
          _buildCharacterOrigen(),
        ],
      ),
    );
  }

  Widget _buildCharacterImage(Size size) {
    if (kIsWeb) {
      return Container(
        margin: const EdgeInsets.all(20),
        height: size.height * 0.33,
        width: 50,
        child: Placeholder(),
      );
    } else {
      return Card(
        margin: const EdgeInsets.only(left: 85, right: 85),
        elevation: 2,
        child: Image(
          image: NetworkImage(rickAndMortyApi.results[index].image),
          height: 200,
          fit: BoxFit.fill,
        ),
      );
    }
  }

  Widget _buildCharacterName() {
    return Text(
      rickAndMortyApi.results[index].name,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 25, color: Colors.grey),
    );
  }

  Widget _buildCharacterLocation() {
    return Text(
      'Location \n${rickAndMortyApi.results[index].location.name}',
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  Widget _buildCharacterOrigen() {
    return Text(
      'Origin \n ${rickAndMortyApi.results[index].origin.name}',
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }
}
