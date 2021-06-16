import 'package:ecommers_app/presentation/cubit/rickandmorty_characters/cubit.dart';
import 'package:ecommers_app/presentation/widgets/error_message.dart';
import 'package:ecommers_app/presentation/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import 'rickandmorty_characters.dart';

class HomeBodyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (_) => sl<RickandmortyCharactersCubit>(),
      child:
          BlocBuilder<RickandmortyCharactersCubit, RickandmortyCharactersState>(
        builder: (context, state) {
          return _buildContentFromState(context, state, size);
        },
      ),
    );
  }

  Widget _buildContentFromState(
    BuildContext context,
    RickandmortyCharactersState state,
    Size size,
  ) {
    if (state is RickandmortyCharactersInitial) {
      _getCharacters(context);
      return LoadingIndicator();
    } else if (state is RickandmortyCharactersLoading) {
      return LoadingIndicator();
    } else if (state is RickandmortyCharactersLoaded) {
      final rickAndMortyApi = state.rickAndMortyApi;
      return RickAndMortyCharacters(rickAndMortyApi: rickAndMortyApi);
    } else if (state is RickandmortyCharactersError) {
      return ErrorMessage(
        message: state.message,
        onPressed: () => _getCharacters(context),
      );
    } else {
      return Container(
        child: Center(
          child: Text('Error'),
        ),
      );
    }
  }

  void _getCharacters(BuildContext context) async {
    final rickandmortyapicharacters =
        context.read<RickandmortyCharactersCubit>();
    rickandmortyapicharacters.getRickAndMortyCharacters();
  }
}
