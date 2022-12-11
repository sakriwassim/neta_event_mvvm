import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import '../../tickets/views_tickets/widget/pack_card_widget.dart';
import '../packs_repositories/packs_api.dart';
import '../view_model_packs/one_pack_view_model.dart';
import '../view_model_packs/packs_view_model.dart';
import 'get_all_pack_view_body.dart';

class GetAllPackView extends StatefulWidget {
  const GetAllPackView({super.key});

  @override
  State<GetAllPackView> createState() => _GetAllPackViewState();
}

class _GetAllPackViewState extends State<GetAllPackView> {
  var data = PacksViewModel(packsRepository: PacksApi());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
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
          ],
        ),
      ),
      body: GetAllPackViewBody(),
    );
  }
}
