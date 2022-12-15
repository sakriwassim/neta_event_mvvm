import 'package:flutter/material.dart';

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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            color: Colors.white,
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    //color: Colors.blue,
                    child: Image.asset(
                      '$image',
                      width: MediaQuery.of(context).size.width * 0.05,
                      height: MediaQuery.of(context).size.height * 0.05,
                      //scale: 0.1,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    // color: Colors.red,
                    child: Text(
                      "$title",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
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
