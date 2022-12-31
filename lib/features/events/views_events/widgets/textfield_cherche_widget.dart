import 'package:flutter/material.dart';

class TextFieldChercheWidget extends StatelessWidget {
  const TextFieldChercheWidget({
    Key? key,
    required TextEditingController chercherController,
  })  : _chercherController = chercherController,
        super(key: key);

  final TextEditingController _chercherController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _chercherController,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Chercher',
        hintStyle: TextStyle(
          fontFamily: 'AirbnbCereal',
          fontWeight: FontWeight.w400,
          fontSize: 20.0,
          color: Colors.grey,
        ),
      ),
    );
  }
}
