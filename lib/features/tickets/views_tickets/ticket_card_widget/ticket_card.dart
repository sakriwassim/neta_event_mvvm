import 'package:flutter/material.dart';
import '../../../../core/colors.dart';
import '../../../../core/size_config.dart';
import '../../../../core/widgets/circle_image.dart';
import '../../../../core/widgets/rectangle_image.dart';
import '../../../../core/widgets/text_widget_text1.dart';
import '../../models_tickets/ticket_model.dart';

class TicketCardWidget extends StatelessWidget {
  TicketModel? ticketModel;

  TicketCardWidget({super.key, required this.ticketModel});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenHeight(5),
          vertical: getProportionateScreenWidth(5)),
      child: Container(
        decoration: BoxDecoration(
          gradient: gradientbackgroundticket,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),

        height: getProportionateScreenHeight(150), //120,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenHeight(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleImage(
                height: 100,
                image: "${ticketModel?.prix}",
                width: 100,
              ),

              SizedBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextAirbnbCereal(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.w400,
                          size: 25,
                          title: "${ticketModel?.libelle}"),
                    ],
                  ),
                ),
              ),
              //Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(60),
                    // height: double.infinity,
                    //color: Colors.blue,
                    child: RectangleImage(
                      height: 60,
                      width: 20,
                      image: "${ticketModel?.Qr_code}",
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  TextAirbnbCereal(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.w500,
                      size: 12,
                      title: "${ticketModel?.prix} fcfa"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
