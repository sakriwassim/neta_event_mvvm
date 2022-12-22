import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterRow extends StatelessWidget {
  Function navtoRegisterView;
  RegisterRow({Key? key, required this.navtoRegisterView}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          " Vous avez déjà un compte?",
          style: GoogleFonts.lato(
            fontStyle: FontStyle.normal,
            fontSize: 15,
          ),
        ), //authentification
        InkWell(
          onTap: () {
            navtoRegisterView();
          },
          child: Text(
            " Signin",
            style: GoogleFonts.lato(
                fontStyle: FontStyle.normal,
                fontSize: 15,
                color: Color.fromRGBO(194, 32, 124, 1)),
          ),
        ),
      ],
    );
  }
}