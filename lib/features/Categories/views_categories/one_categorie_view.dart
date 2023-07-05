import 'package:flutter/material.dart';
import '../categories_repositories/categories_api.dart';
import '../view_model_categories/one_categorie_view_model.dart';
import '../view_model_categories/categories_view_model.dart';

class OnCategorieView extends StatefulWidget {
  const OnCategorieView ({Key? key}) : super(key: key);

  @override
  State<OnCategorieView> createState() => _OnCategorieViewState();
}

class _OnCategorieViewState extends State<OnCategorieView> {
  var data = CategoriesViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(data.title)),
      body: Center(
        child: FutureBuilder<OneCategorieViewModel>(
          future: data.GetCategorieByID(2),
          builder: ((context, snapshot) {
            if (!snapshot.hasData) {
              return Text(snapshot.data!.libelle);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const CircularProgressIndicator();
          }),
        ),
      ),
    );
  }
}
