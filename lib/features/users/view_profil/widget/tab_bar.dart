import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  // _tabController ;
  const TabBarWidget({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: const Color.fromARGB(255, 214, 9, 204),
      isScrollable: true,
      controller: _tabController,
      labelColor: const Color.fromARGB(255, 214, 9, 204),
      unselectedLabelColor: Colors.grey,
      tabs: const [
        Tab(text: "DONNEES"),
        Tab(text: "PHOTO"),
        Tab(text: "MOT DE PASSE"),
      ],
    );
  }
}
