// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../core/size_config.dart';
import '../../Categories/view_model_categories/one_categorie_view_model.dart';
import '../../Categories/views_categories/widget/categorie_card_widget.dart';

class CategoriesWidgetHome extends StatelessWidget {
  List<OneCategorieViewModel>? categories;
  CategoriesWidgetHome({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(150),
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: categories?.length,
          itemBuilder: (context, index) => InkWell(
                onTap: () {
                  // indexCategories = index;

                  // setState(() {
                  //   // data.GetEventByCategorie(
                  //   //     2);
                  // });
                },
                child: CategorieCardWidget(
                  libelle: categories![index].libelle,
                  image: categories![index].image,
                ),
              )),
    );
  }
}
