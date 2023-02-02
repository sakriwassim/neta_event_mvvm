import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/widgets/circle_image.dart';
import 'package:neta_event_mvvm/core/widgets/rectangle_image.dart';
import '../../../../core/colors.dart';
import '../../../../core/int.dart';
import '../../../../core/size_config.dart';
import '../../../../core/widgets/image_cached_internet.dart';
import '../../../../core/widgets/small_button_style.dart';
import '../../../../core/widgets/text_widget_text1.dart';

class NotificationCardWidgetH extends StatelessWidget {
  String? image;
  String? libelle;
  String? periode;
  String? nbr_participant;
  String? montant_regulier;
  String? status;
  int? id;
  Function? callbackFunction;

  NotificationCardWidgetH({
    Key? key,
    required this.id,
    required this.image,
    required this.libelle,
    required this.periode,
    required this.nbr_participant,
    required this.montant_regulier,
    required this.status,
    required this.callbackFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    //horizontal: getProportionateScreenHeight(5),
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenHeight(5),
          vertical: getProportionateScreenWidth(5)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        height: getProportionateScreenHeight(80),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(10),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: CircleImage(
                    height: 60,
                    image: '$image',
                    width: 60,
                  ),
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(10)),
              Expanded(
                flex: 4,
                child: SizedBox(
                  // height: 150,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(10)),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            //color: Colors.blue,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextAirbnbCereal(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w500,
                                  size: 15,
                                  title: "$libelle",
                                ),
                                TextAirbnbCereal(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w400,
                                  size: 12,
                                  title: "$libelle",
                                ),
                              ],
                            ),
                          ),
                          TextAirbnbCereal(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w400,
                            size: 15,
                            title: "$nbr_participant participants",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
