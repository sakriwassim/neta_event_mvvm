import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../features/home/bottom_navigation_bar.dart';
import '../../features/tontines/models_tontines/add_tontine_model.dart';
import '../../features/tontines/models_tontines/tontine_model.dart';
import '../../features/tontines/view_model_tickets/tontines_view_model.dart';
import '../colors.dart';
import '../size_config.dart';
import '../string.dart';
import '../widgets/card_google_widget.dart';
import '../widgets/text_widget_text1.dart';

class PaymentScreen extends StatelessWidget {
  AddTontineModel? addTontineModel;
  PaymentScreen({required this.addTontineModel, super.key});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TontinesViewModel>(context, listen: true);

    addtontine() async {
      print("ti5dem");
      if (provider.loading == false) {
        await provider.AddTontine(addTontineModel);
        if (provider.isBack) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MyHomePage(),
              ));
        }
      }
    }

    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        shadowColor: Colors.white,
        title: const Text(
          "Payment",
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15)),
                child: InkWell(
                  onTap: () {},
                  child: CardGoogle(
                    image: paypalLogo,
                    title: 'PAYPAL',
                    height: getProportionateScreenHeight(80),
                    width: getProportionateScreenWidth(300),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenHeight(15)),
                child: InkWell(
                  onTap: () {},
                  // child: MediumButton(text: "VISA")

                  child: CardGoogle(
                    image: visaLogo,
                    title: 'VISA',
                    height: getProportionateScreenHeight(80),
                    width: getProportionateScreenWidth(300),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenHeight(15)),
                child: InkWell(
                  onTap: () {},
                  child: CardGoogle(
                    image: PayoneerLogo,
                    title: 'Payoneer',
                    height: getProportionateScreenHeight(80),
                    width: getProportionateScreenWidth(300),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenHeight(15)),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: getProportionateScreenHeight(200),
                      width: getProportionateScreenWidth(300),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        gradient: gradientbackground,
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text(
                                  "Tontine groupe",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "12 personnes",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text(
                                  "Price",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "5 Fcfa",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text(
                                  "Total",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "5 Fcfa",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: getProportionateScreenHeight(50),
                              width: getProportionateScreenWidth(200),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(13.0),
                              ),
                              child: InkWell(
                                onTap: () {
                                  addtontine();
                                },
                                child: const Center(
                                  child: Text(
                                    "Place My Order",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 213, 33, 171),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    ),
                  )),
              TextAirbnbCereal(
                title: "${provider.messege ?? ""} ${provider.statusCode ?? ""}",
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(255, 255, 0, 0),
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
