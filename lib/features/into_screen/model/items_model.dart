class Items {
  final String img;
  final String title;
  final String subTitle;

  ///
  Items({
    required this.img,
    required this.title,
    required this.subTitle,
  });
}

List<Items> listOfItems = [
  Items(
      img: "assets/image/intro/1.png",
      title: "L'achat de vos ticket est devenu facile avec nous",
      subTitle: ""
      //  "There are 25.000+ best medical\njobs and schools, choose your\nchoice now",
      ),
  Items(
      img: "assets/image/intro/2.png",
      title: "Payer vos un ticket en toute sécurité",
      subTitle: ""
      //    "There will be many people who\n want hear your stories and\n experiences",
      ),
  Items(
      img: "assets/image/intro/3.png",
      title: "Des événements tout au long de l'année",
      subTitle: ""
      //"Make your friendship and create a\nnew community",
      ),
];
