// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../core/size_config.dart';
import '../../Categories/view_model_categories/one_categorie_view_model.dart';
import '../../Categories/views_categories/widget/categorie_card_widget.dart';
import '../../tontines/models_tontines/tontine_model.dart';
import '../../tontines/views_tontines/one_tontine_view.dart';
import '../../tontines/views_tontines/widget/tontine_card_widget.dart';

class TontinesWidgetHome extends StatelessWidget {
  List<TontineModel>? tontines;
  TontinesWidgetHome({
    Key? key,
    required this.tontines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(350),
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: tontines?.length,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OnTontineView(
                              tontine: tontines![index],
                              // id: tontines![index].id!,
                              // image: '${tontines![index].image!}',
                            )),
                  );
                },
                child: TontineCardWidget(
                  image: tontines![index].image,
                  libelle: tontines![index].libelle,
                  montant_regulier: tontines![index].montant_regulier,
                  nbr_participant: tontines![index].nbr_participant,
                ),
              )),
      //     }
      //   }),
      // ),
    );
  }
}
