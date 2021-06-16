import 'package:ecommers_app/data/models/rickandmortyapi_model.dart';
import 'package:ecommers_app/presentation/views/details/view.dart';
import 'package:flutter/material.dart';

class CharactersCard extends StatelessWidget {
  const CharactersCard({
    Key? key,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
    required this.index,
    required this.rickAndMortyApi,
  }) : super(key: key);
  final RickAndMortyApi rickAndMortyApi;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsView(
                    index: index, rickAndMortyApi: rickAndMortyApi)));
      },
      child: Card(
        elevation: 1.0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            children: [_buildDescripcionList()],
          ),
        ),
      ),
    );
  }

  Row _buildDescripcionList() {
    return Row(
      children: [
        _buildImageNetWork(),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Status: $status',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Text(
              'Name: $name',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Text(
              'Gender: $gender',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Text(
              'Species: $species',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        )
      ],
    );
  }

  Row _buildImageNetWork() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.network(
          image,
          scale: 3,
        )
      ],
    );
  }
}
