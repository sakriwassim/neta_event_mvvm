import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.cyan,
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        Container(
          color: Colors.blue,
          height: MediaQuery.of(context).size.height * 0.1,
        ),
      ],
    );
  }
}
