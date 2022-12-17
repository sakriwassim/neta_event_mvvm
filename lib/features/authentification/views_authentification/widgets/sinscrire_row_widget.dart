import 'package:flutter/material.dart';

class SinscrireRow extends StatelessWidget {
  Function navtoRegisterView;
  SinscrireRow({Key? key, required this.navtoRegisterView}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          " Vous n'avez pas un compte",
          style: TextStyle(
            fontSize: 13,
            color: Colors.black,
          ),
        ),
        InkWell(
          onTap: () {
            navtoRegisterView();
          },
          child: const Text(
            " S'inscrire",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.pink,
            ),
          ),
        ),
      ],
    );
  }
}
