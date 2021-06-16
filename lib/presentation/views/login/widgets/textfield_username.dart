import 'package:flutter/material.dart';

class TextFieldUserName extends StatelessWidget {
  const TextFieldUserName({
    Key? key,
    required this.onChangedUserName,
  }) : super(key: key);
  final Function(String) onChangedUserName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[200]!))),
      child: TextField(
        onChanged: onChangedUserName,
        decoration: InputDecoration(
          hintText: 'Usuario',
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
