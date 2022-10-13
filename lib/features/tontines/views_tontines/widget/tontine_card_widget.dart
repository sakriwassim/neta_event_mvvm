import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/colors.dart';

class TontineCardWidget extends StatelessWidget {
  String? libelle;
  String? nbr_participant;
  String? montant_regulier;
  TontineCardWidget({
    Key? key,
    required this.libelle,
    required this.nbr_participant,
    required this.montant_regulier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) => SingleTontineScreen()),
        // );
      },
      child: Container(
        color: Colors.grey[50],
        child: Stack(
          children: [
            ClipPath(
                clipper: TriangleClipper(),
                child: Container(
                  decoration: BoxDecoration(gradient: gradientbackground),
                  height: 220,
                  width: 220,
                )),
            Padding(
              padding: EdgeInsets.only(top: 73, left: 20),
              child: Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                    blurRadius: 15.0,
                  ),
                ]),
                child: Container(
                  height: 180,
                  width: 180,
                  color: Colors.white,
                  child: Column(children: [
                    Image.asset(
                      "assets/téléchargement 4.png",
                      width: 230,
                      fit: BoxFit.contain,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            libelle!,
                            style: TextStyle(
                                fontFamily: 'AirbnbCereal',
                                fontSize: 8,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffE28541)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Lorem espium anturium ka',
                            style: TextStyle(
                              fontFamily: 'AirbnbCereal',
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '$montant_regulier\$ Chaque trimestre',
                            style: TextStyle(
                              fontFamily: 'AirbnbCereal',
                              fontSize: 10,
                              color: Color(0xff4F4F4F),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '$nbr_participant participants',
                            style: TextStyle(
                              fontFamily: 'AirbnbCereal',
                              fontSize: 10,
                              color: Color(0xff4F4F4F),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Center(
                            child: Container(
                              height: 25.0,
                              width: 50,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Ink(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xff8301BC),
                                          Color(0xffD2286A)
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                      borderRadius: BorderRadius.circular(4.0)),
                                  child: Container(
                                    constraints: const BoxConstraints(
                                        maxWidth: 270.0, minHeight: 100.0),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Participer',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'AirbnbCereal',
                                          color: Colors.white,
                                          fontSize: 8,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(size.width / 2, 0) // point p1
      ..lineTo(0, size.height / 3) // point p2
      ..lineTo(size.width, size.height / 3)
      ..lineTo(size.width / 2, 0) // point p3
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
