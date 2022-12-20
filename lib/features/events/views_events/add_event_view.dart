import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neta_event_mvvm/core/decoration.dart';
import 'package:neta_event_mvvm/core/int.dart';
import 'package:neta_event_mvvm/features/events/views_events/widgets/categorie_icon_widget.dart';
import '../../../core/widgets/text_widget_text2.dart';
import '../../Categories/categories_repositories/categories_api.dart';
import '../../Categories/view_model_categories/categories_view_model.dart';
import '../../Categories/view_model_categories/one_categorie_view_model.dart';
import '../../imageupload/images_repositories/images_api.dart';
import '../../imageupload/view_model_images/images_view_model.dart';
import '../models_events/add_event_model.dart';
import '../evants_repositories/events_api.dart';
import '../view_model_events/events_view_model.dart';

class AddEventView extends StatefulWidget {
  const AddEventView({
    super.key,
  });

  @override
  State<AddEventView> createState() => _AddEventViewState();
}

class _AddEventViewState extends State<AddEventView> {
  int selectedIndex = -1;
  final formkey = GlobalKey<FormState>();
  late String libellefield;
  late int prixfield;
  late String descriptionfield;
  late String _yourVariable;
  List<DateTime?> _dataTime = [];
  List<OneCategorieViewModel>? categories = [];
  double _currentSliderValue = 0;
  String? imagepath;
  int currentStep = 0;

  var datacategorie = CategoriesViewModel(ticketsRepository: CategoriesApi());

  var data = EventsViewModel(eventsRepository: EventsApi());
  var dataimage = ImagesViewModel(imagesRepository: ImagesApi());

  final ImagePicker _picker = ImagePicker();
  List<XFile>? _imageFileList;
  dynamic _pickImageError;

  Future<void> _onImageButtonPressed(ImageSource source,
      {BuildContext? context}) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
      );

      imagepath = await dataimage.addImage(pickedFile);
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
            shadowColor: Colors.white,
            elevation: 0.0,
            backgroundColor: Colors.white,
            title: const Text(
              "Add event",
              style: TextStyle(
                color: Colors.black,
              ),
            )),
        body: Stepper(
          type: StepperType.horizontal,
          steps: getSteps(),
          currentStep: currentStep,
          onStepContinue: () {
            final isLastStep = currentStep == getSteps().length - 1;
            if (isLastStep) {
              //  if (formkey.currentState!.validate()) {
              var event = {
                "category_id": categories![selectedIndex].id,
                // "category_id": 1,
                "observation_id": 21,
                "libelle": libellefield,
                "description": descriptionfield,
                "prix": _currentSliderValue.toInt(),
                "date_heure": _dataTime.toString(),
                "adresse": "Stade du 26 Mars",
                "nbre_tichet": 1000,
                "status": "statut",
                "image": "imagepath"
              };
              AddEventModel eventformJson = AddEventModel.fromJson(event);
              //  print(eventformJson);
              setState(() {
                data.AddEvent(eventformJson);
              });
              // }
            } else {
              setState(() => currentStep += 1);
            }
          },
          onStepCancel: currentStep == 0
              ? null
              : () {
                  setState(() {
                    currentStep -= 1;
                  });
                },
        ));
  }

  List<Step> getSteps() => [
        Step(
          isActive: currentStep >= 0,
          title: const Text(''),
          content: Column(
            children: [
              SizedBox(
                width: widthbigbutton,
                height: heightbigbutton,
                child: TextFormField(
                  decoration: textFieldDecoration(
                    "Nom de levenment",
                    "entre le nom de levenment",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Nom de levenment";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (text) {
                    libellefield = text;
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    var _newDate = await showCalendarDatePicker2Dialog(
                      context: context,
                      config: CalendarDatePicker2WithActionButtonsConfig(),
                      dialogSize: const Size(325, 400),
                      initialValue: [],
                      borderRadius: BorderRadius.circular(15),
                    );
                    if (_newDate != null) {
                      setState(() {
                        _dataTime = _newDate;
                      });
                    }
                  },
                  child: const Text("Parcourire ce calendrier")),
              Text('$_dataTime'),
              SizedBox(
                width: widthbigbutton,
                height: heightbigbutton,
                child: TextFormField(
                  decoration: textFieldDecoration(
                    "localisation",
                    "entre le localisation",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "le localisation";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (text) {
                    prixfield = 7;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5),
                alignment: Alignment.topLeft,
                child: const Text("Categories",
                    style: TextStyle(
                      fontFamily: 'AirbnbCereal',
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    )),
              ),
              SizedBox(
                height: 120,
                child: FutureBuilder<List<OneCategorieViewModel>>(
                  future: datacategorie.FetchAllCategories(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      categories = snapshot.data;
                      return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: categories?.length,
                          itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: CategorieIconWidget(
                                  libelle: categories![index].libelle,
                                  backgroundColor: selectedIndex == index
                                      ? const Color(0xffD2286A)
                                      : Colors.grey,
                                ),
                              ));
                    }
                  }),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text("Selection le prix",
                              style: TextStyle(
                                fontFamily: 'AirbnbCereal',
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text("${_currentSliderValue.toInt()}",
                              style: const TextStyle(
                                fontFamily: 'AirbnbCereal',
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Slider(
                        value: _currentSliderValue,
                        max: 100,
                        divisions: 100,
                        label: _currentSliderValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: widthbigbutton,
                height: heightbigbutton,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: textFieldDecoration(
                      "publicite",
                      "entre le publicite",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "entre publicite";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (text) {
                      descriptionfield = text;
                    },
                  ),
                ),
              ),
              // InkWell(
              //     onTap: () {
              //       if (formkey.currentState!.validate()) {
              //         var event = {
              //           "category_id": categories![selectedIndex].id,
              //           "observation_id": 21,
              //           "libelle": libellefield,
              //           "description": descriptionfield,
              //           "prix": _currentSliderValue.toInt(),
              //           "date_heure": _dataTime.toString(),
              //           "adresse": "Stade du 26 Mars",
              //           "nbre_tichet": 1000,
              //           "status": "statut",
              //           "image": "image"
              //         };

              //         AddEventModel eventformJson =
              //             AddEventModel.fromJson(event);
              //         //  print(eventformJson);

              //         setState(() {
              //           data.AddEvent(eventformJson);
              //         });
              //       }
              //     },
              //     child: MediumButton(text: "APPLIQUER")

              //     ),
            ],
          ),
        ),
        Step(
          isActive: currentStep >= 1,
          title: const Text(''),
          content: Column(
            children: [
              SizedBox(
                width: widthbigbutton,
                height: heightbigbutton,
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  decoration: textFieldDecoration(
                    "publicite",
                    "entre le publicite",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "entre publicite";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (text) {
                    descriptionfield = text;
                  },
                ),
              ),
              // InkWell(onTap: () {}, child: MediumButton(text: "APPLIQUER")),
            ],
          ),
        ),
        Step(
          isActive: currentStep >= 2,
          title: const Text(''),
          content: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextWidget(
                  title: "choisir une photo de levenement ",
                  fontSize: 18.00,
                  fontWeight: FontWeight.w200,
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 20, right: 10, left: 10),
                    child: InkWell(
                      onTap: () async {
                        await _onImageButtonPressed(ImageSource.camera,
                            context: context);
                      },
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: SvgPicture.asset(
                              "assets/icon_user/CameraButton.svg")),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 20, right: 10, left: 10),
                    child: InkWell(
                      onTap: () async {
                        await _onImageButtonPressed(ImageSource.gallery,
                            context: context);
                      },
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: SvgPicture.asset(
                              "assets/icon_user/GalleryButton.svg")),
                    ),
                  ),
                ],
              ),
              // InkWell(onTap: () {}, child: MediumButton(text: "APPLIQUER")),
            ],
          ),
        )
      ];
}
