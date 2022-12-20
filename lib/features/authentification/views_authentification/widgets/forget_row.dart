//import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetpasswordRow extends StatefulWidget {
  const ForgetpasswordRow({super.key});

  @override
  State<ForgetpasswordRow> createState() => _ForgetpasswordRowState();
}

class _ForgetpasswordRowState extends State<ForgetpasswordRow> {
  @override
  Widget build(BuildContext context) {
    bool isSwitched = false;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 10),
              //   child: CustomSwitch(
              //     value: isSwitched,
              //     activeColor: Color.fromRGBO(194, 32, 124, 1),
              //     onChanged: (value) {
              //       print("VALUE : $value");
              //       setState(() {
              //         isSwitched = value;
              //       });
              //     },
              //   ),
              // ),
              Text(
                "Se rappeler",
                style: GoogleFonts.lato(
                  fontStyle: FontStyle.normal,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          //authentification
          InkWell(
            onTap: () {},
            child: Text(
              "Mot de passe oublié",
              style: GoogleFonts.lato(
                  fontStyle: FontStyle.normal,
                  fontSize: 15,
                  color: Color.fromRGBO(194, 32, 124, 1)),
            ),
          ),
        ],
      ),
    );
  }
}
