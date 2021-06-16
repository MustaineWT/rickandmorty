import 'package:ecommers_app/core/framework/colors.dart';
import 'package:flutter/material.dart';

import 'widgets/home_body_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: _buildAppBar(context),
      body: HomeBodyView(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Text('Rick and Morty characters'),
    );
  }
}
