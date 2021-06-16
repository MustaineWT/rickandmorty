import 'package:flutter/material.dart';

class TextFieldPassword extends StatelessWidget {
  const TextFieldPassword(
      {Key? key,
      required this.onPressedIcon,
      required this.secureText,
      required this.onChangedPassword})
      : super(key: key);
  final bool secureText;
  final Function() onPressedIcon;
  final Function(String) onChangedPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[200]!))),
      child: TextField(
        onChanged: onChangedPassword,
        decoration: InputDecoration(
          hintText: 'Contraseña',
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: Icon(secureText ? Icons.remove_red_eye : Icons.security),
            onPressed: onPressedIcon,
          ),
        ),
        obscureText: secureText,
      ),
    );
  }

  void submitPassword(BuildContext context, String password) {}
}
