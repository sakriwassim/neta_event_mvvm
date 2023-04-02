import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/colors.dart';
import '../../../../core/size_config.dart';
import '../../../../core/string.dart';
import '../../../../core/widgets/circle_image.dart';
import '../../../../core/widgets/rectangle_image.dart';
import '../../../../core/widgets/text_widget_text1.dart';
import '../../../events/view_model_events/events_view_model.dart';
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
          borderRadius: BorderRadius.all(Radius.circular(20)),

          image:
              DecorationImage(image: AssetImage(ticketbg), fit: BoxFit.cover),
          // gradient: gradientbackgroundticket,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),

        height: getProportionateScreenHeight(170), //120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Container(
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //         image: AssetImage(nocodeqr), fit: BoxFit.cover),
            //     borderRadius: BorderRadius.only(
            //       topRight: Radius.circular(100),
            //       bottomRight: Radius.circular(100),
            //     ),
            //     color: Colors.blue[300],
            //   ),
            //   width: 100,
            // ),
            SizedBox(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 20, vertical: getProportionateScreenHeight(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextAirbnbCereal(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w900,
                        size: 35,
                        title: "${ticketModel?.libelle}"),
                    TextAirbnbCereal(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w500,
                        size: 20,
                        title: "${ticketModel?.date}"),
                    TextAirbnbCereal(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w500,
                        size: 15,
                        title: "${ticketModel?.description}"),
                  ],
                ),
              ),
            ),
            //Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(60),
                    child: ticketModel?.Qr_code == null &&
                            ticketModel?.Qr_code == ""
                        ? RectangleImage(
                            height: 60,
                            width: 20,
                            image: "${ticketModel?.Qr_code}",
                          )
                        : Image.asset(nocodeqr),
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
            ),
          ],
        ),
      ),
    );
  }
}
