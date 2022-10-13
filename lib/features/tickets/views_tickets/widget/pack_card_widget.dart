import 'package:flutter/material.dart';

class PackCardWidget extends StatelessWidget {
  String libelle;
  PackCardWidget({Key? key, required this.libelle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          height: 300,
          width: 244,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  height: 265,
                  width: 244,
                  color: Colors.white,
                ),
              ),
              Positioned(
                  top: 0,
                  left: 20,
                  child: Stack(
                    children: [
                      Image.asset('assets/Rectangle 4291.png'),
                      Positioned(
                          top: 21,
                          left: 50.5,
                          child: Text(
                            libelle,
                            style: TextStyle(
                                fontFamily: 'AirbnbCereal',
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ))
                    ],
                  )),
              const Positioned(
                left: 70,
                top: 75,
                child: Text(
                  '10 euro',
                  style: TextStyle(
                      fontFamily: 'AirbnbCereal',
                      fontSize: 30,
                      fontWeight: FontWeight.w300),
                ),
              ),
              Positioned(bottom: 0, child: Image.asset('assets/Vector 19.png')),
              Positioned(
                left: 60,
                top: 175,
                child: Row(
                  children: [
                    Image.asset('assets/darkTick.png'),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '3 évenèments',
                      style: const TextStyle(
                          fontFamily: 'AirbnbCereal',
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 60,
                top: 210,
                child: Row(
                  children: [
                    Image.asset('assets/darkTick.png'),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '7 jours de publicité',
                      style: const TextStyle(
                          fontFamily: 'AirbnbCereal',
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 75,
                top: 250,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/Rectangle 4296.png'),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                    Positioned(
                      top: 6,
                      left: 23,
                      child: Text(
                        textAlign: TextAlign.center,
                        'Acheter',
                        style: TextStyle(
                            fontFamily: 'AirbnbCereal',
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
