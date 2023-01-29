// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../core/size_config.dart';
import '../../Categories/view_model_categories/one_categorie_view_model.dart';
import '../../Categories/views_categories/widget/categorie_card_widget.dart';
import '../../packs/view_model_packs/one_pack_view_model.dart';
import '../../packs/widget/pack_card_widget.dart';

class PacksWidgetHome extends StatelessWidget {
  List<OnePackViewModel>? packs;
  PacksWidgetHome({
    Key? key,
    required this.packs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: getProportionateScreenHeight(300),
      child: Center(
        child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: packs?.length,
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {},
                        child: PackCardWidget(
                          libelle: '${packs![index].libelle}',
                          montant: '${packs![index].montant}',
                          nbre_events: '${packs![index].nbre_events}',
                          nbre_jr_pubs: '${packs![index].nbre_jr_pubs}',
                        ),
                      )),
          
          
      )
    );
  
  
  }
}




