import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CardGoogle extends StatelessWidget {
  String? image;
  String? title;
  double? height;
  double? width;
  CardGoogle(
      {Key? key,
      required this.image,
      required this.title,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height, //80
        width: width, //300
        child: InkWell(
          onTap: () {},
          child: Card(
            elevation: 5,
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    child: SvgPicture.asset("$image"),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    child: Text(
                      "$title",
                      style: GoogleFonts.lato(
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
