import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:provider/provider.dart';
import '../../../core/size_config.dart';
import '../view_model_packs/packs_view_model.dart';
import '../widget/packList_widget.dart';



class GetAllPackViewBody extends StatefulWidget {

  const GetAllPackViewBody({Key? key}) : super(key: key);

  @override
  State<GetAllPackViewBody> createState() => _GetAllPackViewBodyState();
}

class _GetAllPackViewBodyState extends State<GetAllPackViewBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<PacksViewModel>(context, listen: false).FetchAllPacks();
    });
  }

  @override
  Widget build(BuildContext context) {
    var packs = Provider.of<PacksViewModel>(context, listen: true).packs;
    SizeConfig().init(context);
    return Scaffold(
        body: OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;
        //  if (connected) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(40),
          ),
          child: Center(
            child: PackListWidget(packs: packs),
          ),
        );
      },
      child: Center(
        child: Text("no connection"),
      ),
    ));
  }
}
