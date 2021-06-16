import 'package:ecommers_app/data/models/rickandmortyapi_model.dart';
import 'package:flutter/material.dart';

import 'widgets/details_body_view.dart';

class DetailsView extends StatelessWidget {
  const DetailsView(
      {Key? key, required this.index, required this.rickAndMortyApi})
      : super(key: key);
  final int index;
  final RickAndMortyApi rickAndMortyApi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: DetailsBodyView(index: index, rickAndMortyApi: rickAndMortyApi),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text('Detail Character'),
    );
  }
}
