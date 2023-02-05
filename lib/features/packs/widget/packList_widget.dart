import 'package:flutter/material.dart';

import '../view_model_packs/one_pack_view_model.dart';
import 'pack_card_widget.dart';

class PackListWidget extends StatelessWidget {
  const PackListWidget({
    Key? key,
    required this.packs,
  }) : super(key: key);

  final List<OnePackViewModel> packs;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: packs.length,
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {},
                child: PackCardWidget(
                  libelle: '${packs[index].libelle}',
                  montant: '${packs[index].montant}',
                  nbre_events: '${packs[index].nbre_events}',
                  nbre_jr_pubs: '${packs[index].nbre_jr_pubs}',
                ),
              ),
            ));
  }
}
