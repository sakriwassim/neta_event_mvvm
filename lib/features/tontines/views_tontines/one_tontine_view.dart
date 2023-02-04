// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/colors.dart';
import '../../../core/int.dart';
import '../../../core/size_config.dart';
import '../../../core/widgets/app_bar_details.dart';
import '../../../core/widgets/image_cached_internet.dart';
import '../../../core/Screen/payment_screen.dart';
import '../../../core/widgets/small_button_style.dart';
import '../../../core/widgets/text_widget_text1.dart';
import '../../users/view_model_events/events_view_model.dart';
import '../models_tontines/tontine_model.dart';

class OnTontineView extends StatefulWidget {
  TontineModel? tontine;

  OnTontineView({
    required this.tontine,
    Key? key,
  }) : super(key: key);

  @override
  State<OnTontineView> createState() => _OnTontineViewState();
}

class _OnTontineViewState extends State<OnTontineView> {
  @override
  void initState() {
    super.initState();
    Provider.of<UsersViewModel>(context, listen: false)
        .GetUserByID(int.parse(widget.tontine!.user_id!));
  }

  @override
  Widget build(BuildContext context) {
    var provideruser = Provider.of<UsersViewModel>(context, listen: false);

    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150.0),
          child: AppBarDetails(
            image: widget.tontine!.image,
            title: 'tontine détaille',
          )),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(25),
                  ),
                  child: Row(
                    children: [
                      TextAirbnbCereal(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        size: 18,
                        title: widget.tontine!.libelle!,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextAirbnbCereal(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          size: 10,
                          title: "Chaque ${widget.tontine!.periode}"),
                      TextAirbnbCereal(
                          color: const Color(0xFFFE28541),
                          fontWeight: FontWeight.w500,
                          size: 10,
                          title: "Chaque ${widget.tontine!.libelle}"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextAirbnbCereal(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        size: 18,
                        title: "Participants",
                      ),
                      TextAirbnbCereal(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w500,
                          size: 10,
                          title:
                              "${widget.tontine!.nbr_participant} participants"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextAirbnbCereal(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        size: 18,
                        title: "Montants",
                      ),
                      TextAirbnbCereal(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w500,
                          size: 10,
                          title: "${widget.tontine!.montant_regulier} fcfa"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextAirbnbCereal(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  size: 18,
                  title: "Next Owner",
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 100,
                  height: 100,
                  child: CircleAvatar(
                    child: ClipOval(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: ImageCachedInternet(
                          height: MediaQuery.of(context).size.height,
                          imageUrl: '${provideruser.userById?.image}',
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextAirbnbCereal(
                  color: const Color(0xFF777777),
                  fontWeight: FontWeight.w400,
                  size: 16,
                  title: "${provideruser.userById?.nomComplet}",
                ),
                TextAirbnbCereal(
                  color: const Color(0xFF777777),
                  fontWeight: FontWeight.w400,
                  size: 16,
                  title: "Next Owner",
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(25),
                  ),
                  child: Row(
                    children: [
                      TextAirbnbCereal(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        size: 25,
                        title: "Participants",
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextAirbnbCereal(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      size: 20,
                      title: "Payer ${widget.tontine!.libelle}",
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaymentScreen()));
                        },
                        child: Button(
                          fontWeight: FontWeight.w500,
                          text: "PAYER",
                          fontSize: 20,
                          gradientbackground: gradientbackground,
                          height: heightmediumbutton,
                          width: widthmediumbutton,
                          textcolor: Colors.white,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
