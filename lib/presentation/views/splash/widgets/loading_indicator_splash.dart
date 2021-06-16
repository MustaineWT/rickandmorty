import 'package:flutter/material.dart';

class LoadingIndicatorSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        color: Colors.white,
        child: Column(children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              )),
              child: Text('Bienvenidos a la aplicación de prueba.')),
          SizedBox(height: 10),
          CircularProgressIndicator()
        ]),
      ),
    );
  }
}
