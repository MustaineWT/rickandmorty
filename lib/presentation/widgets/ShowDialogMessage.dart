import 'package:ecommers_app/presentation/views/login/view.dart';
import 'package:flutter/material.dart';

import 'navigator_utils.dart';

void showDialogMessage(BuildContext context, String title, String message) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Si'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

abstract class ShowDialogMessage {
  static showDialogMessage(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Si'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static showDialogMessageWithFunc(BuildContext context, String title,
      String message, void Function() funct) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext _) {
        return AlertDialog(
          title: Text('Información'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Desea cerrar sesión.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                child: Text('Si'),
                onPressed: () {
                  funct();
                  pushAndReplaceToPage(context, LoginView());
                }),
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static showDialogMessageWithRegister(
      BuildContext context, String title, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext _) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                child: Text('Ok'),
                onPressed: () {
                  pushAndReplaceToPage(context, LoginView());
                }),
          ],
        );
      },
    );
  }

  static showDialogMessageWithRegisterPersonalice(
      BuildContext context, String title, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext _) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.pop(context, 'Registrado');
                  Navigator.pop(context, 'Registrado');
                }),
          ],
        );
      },
    );
  }
}
