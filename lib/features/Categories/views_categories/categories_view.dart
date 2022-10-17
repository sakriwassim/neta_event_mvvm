import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import '../../../core/widgets/small_button_style.dart';
import '../categories_repositories/categories_api.dart';
import '../view_model_categories/one_categorie_view_model.dart';
import '../view_model_categories/categories_view_model.dart';
import 'add_categorie_view.dart';
import 'update_categorie_view.dart';

class GetAllCategorieView extends StatefulWidget {
  const GetAllCategorieView({super.key});

  @override
  State<GetAllCategorieView> createState() => _GetAllCategorieViewState();
}

class _GetAllCategorieViewState extends State<GetAllCategorieView> {
  var data = CategoriesViewModel(ticketsRepository: CategoriesApi());

  alertupdate(OneCategorieViewModel obj) => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('êtes-vous sûr!!'),
          content: const Text('de mettre à jour la valeur de compteur'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'MODIFY');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            UpdateCategorieView(ticketObj: obj)));
              },
              child: const Text('MODIFY'),
            ),
            TextButton(
                child: const Text('DELETE'),
                onPressed: () {
                  Navigator.pop(context, 'DELETE');
                  setState(() {
                    data.DeleteCategorieByID(obj.id);
                  });
                }),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.white,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              data.title,
              style: TextStyle(
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
                child: SmallButton(text: "ADD EVENT")),
          ],
        ),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return RefreshIndicator(
              onRefresh: () async {
                setState(() {
                  data.FetchAllCategories();
                });

                return Future.delayed(Duration(seconds: 2));
              },
              child: Center(
                child: FutureBuilder<List<OneCategorieViewModel>>(
                  future: data.FetchAllCategories(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else {
                      var tickets = snapshot.data;
                      return ListView.builder(
                          itemCount: tickets?.length,
                          itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  alertupdate(tickets[index]);
                                },
                                child: ListTile(
                                  title: Text("${tickets![index].montant}",
                                      style: TextStyle(
                                          fontFamily: 'AirbnbCereal',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromARGB(
                                              255, 211, 7, 194))),
                                  subtitle: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("${tickets[index].libelle}",
                                          style: TextStyle(
                                            fontFamily: 'AirbnbCereal',
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          )),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                                "${tickets[index].categorieModel}" +
                                                    "€",
                                                style: const TextStyle(
                                                  fontFamily: 'AirbnbCereal',
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  leading: Image.asset(
                                    "assets/125.png",
                                  ),
                                ),
                              ));
                    }
                  }),
                ),
              ),
            );
          } else {
            return Center(
              child: Text("no connection"),
            );
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'There are no bottons to push :)',
            ),
            new Text(
              'Just turn off your internet.',
            ),
          ],
        ),
      ),
    );
  }
}
