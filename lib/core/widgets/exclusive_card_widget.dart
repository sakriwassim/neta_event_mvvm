import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neta_event_mvvm/core/widgets/text_widget_text1.dart';

import '../size_config.dart';
import '../string.dart';
import 'image_cached_internet.dart';

class ExclusiveCardWidget extends StatelessWidget {
  String? adresse;
  String? image;
  String? prix;
  String? libelle;
  String? date;
  double? width;
  double? height;
  ExclusiveCardWidget({
    Key? key,
    required this.adresse,
    required this.image,
    required this.prix,
    required this.libelle,
    required this.date,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Card(
      //color: Colors.red,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      elevation: 3,
      shadowColor: Colors.grey,
      //color: Color.fromARGB(255, 220, 8, 8),
      child: Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                  // color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                // color: Colors.blue,
                height: getProportionateScreenHeight(height!),
                width: getProportionateScreenWidth(width!), //230
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: getProportionateScreenHeight(height! * 0.5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: ImageCachedInternet(
                              height: MediaQuery.of(context).size.height,
                              imageUrl: '$image',
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            // color: Colors.grey,
                            width: getProportionateScreenWidth(width!),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: getProportionateScreenHeight(50),
                                  width: getProportionateScreenWidth(50),
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 0.7),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SvgPicture.asset(
                                  favori,
                                  height: 40,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(6),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextAirbnbCereal(
                            color: const Color.fromARGB(255, 0, 0, 0), //4F4F4F
                            fontWeight: FontWeight.w500,
                            size: 18,
                            title: libelle!,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    SizedBox(
                      //color: Colors.black54,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Spacer(),
                          // Row(
                          //   children: const [
                          //     Icon(Icons.star, color: Colors.pink, size: 15),
                          //     Icon(Icons.star, color: Colors.pink, size: 15),
                          //     Icon(Icons.star, color: Colors.pink, size: 15),
                          //     Icon(Icons.star, color: Colors.pink, size: 15),
                          //     Icon(Icons.star, color: Colors.grey, size: 15),
                          //   ],
                          // ),
                          TextAirbnbCereal(
                            color: const Color(0xff4F4F4F), //4F4F4F
                            fontWeight: FontWeight.w500,
                            size: 12,
                            title: 'Prix :$prix fcfa',
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          SvgPicture.asset(Locationcard),
                          SizedBox(
                            width: getProportionateScreenWidth(5),
                          ),
                          TextAirbnbCereal(
                            color: const Color(0xFF2B2849), //4F4F4F
                            fontWeight: FontWeight.w500,
                            size: 12,
                            title: adresse!,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




//  Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: getProportionateScreenHeight(5),
//                 vertical: getProportionateScreenWidth(5),
//               ),
//               child: 
//             ),
        


 