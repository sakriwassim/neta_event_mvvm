import 'package:flutter/material.dart';
import 'package:neta_event_mvvm/core/widgets/small_button_style.dart';

import '../../features/Categories/view_model_categories/categories_view_model.dart';
import '../../features/Categories/views_categories/add_categorie_view.dart';
import '../colors.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Appbar({
    Key? key,
    required this.data,
  }) : super(key: key);

  final CategoriesViewModel data;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Colors.white,
      elevation: 0.0,
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            data.title,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddCategorieView()));
              },
              child: Button(
                text: "ADD EVENT",
                height: 40,
                width: 100,
                fontSize: 15,
                gradientbackground: gradientbackground,
              )),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
