import 'package:flutter/material.dart';
import '../packs_repositories/packs_api.dart';
import '../view_model_packs/packs_view_model.dart';
import '../view_model_packs/one_pack_view_model.dart';

class OnPackView extends StatefulWidget {
  const OnPackView({super.key});

  @override
  State<OnPackView> createState() => _OnPackViewState();
}

class _OnPackViewState extends State<OnPackView> {
  var data = PacksViewModel();
  //var api = PacksApi().getPackByID(2);
//packModel
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(data.title)),
      body: Center(
        child: FutureBuilder<OnePackViewModel>(
          future: data.GetPackByID(2),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.libelle);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const CircularProgressIndicator();
          }),
        ),
      ),
      // Text(data.GetPackByID(2).toString())
    );
  }
}
