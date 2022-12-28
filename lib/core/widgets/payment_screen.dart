import 'package:flutter/material.dart';

import '../colors.dart';
import '../size_config.dart';
import 'card_google_widget.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      // AppBar(
      //   title: Text("Payment"),
      // ),
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
                    image: 'assets/tontine/paypal.png',
                    title: 'PAYPAL',
                    height: 80,
                    width: 300,
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
                    image: 'assets/tontine/visa.png',
                    title: 'VISA',
                    height: 80,
                    width: 300,
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
                    image: 'assets/tontine/payoneer.png',
                    title: 'payoneer',
                    height: 80,
                    width: 300,
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
                      height: 200,
                      width: 300,
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
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 50,
                                width: 200,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(13.0),
                                ),
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
                  )

                  //MediumButton(text: "Place My Order")),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
