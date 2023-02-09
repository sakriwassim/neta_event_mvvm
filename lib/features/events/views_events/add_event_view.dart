import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neta_event_mvvm/core/colors.dart';
import 'package:neta_event_mvvm/core/decoration.dart';
import 'package:neta_event_mvvm/core/int.dart';
import 'package:neta_event_mvvm/core/widgets/small_button_style.dart';
import 'package:neta_event_mvvm/features/events/views_events/widgets/categorie_icon_widget.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/text_widget_text1.dart';
import '../../Categories/view_model_categories/categories_view_model.dart';
import '../../Categories/view_model_categories/one_categorie_view_model.dart';
import '../../imageupload/images_repositories/images_api.dart';
import '../../imageupload/view_model_images/images_view_model.dart';
import '../models_events/add_event_model.dart';
import '../view_model_events/events_view_model.dart';

class AddEventView extends StatefulWidget {
  AddEventView({
    super.key,
  });

  @override
  State<AddEventView> createState() => _AddEventViewState();
}

class _AddEventViewState extends State<AddEventView> {
  int selectedIndex = -1;
  final formkey = GlobalKey<FormState>();
  // String libellefield = "";
  int prixfield = -1;

  String _yourVariable = "";
  List<DateTime?> _dataTime = [];
  List<OneCategorieViewModel>? categories = [];
  double _currentSliderValue = 0;
  String? imagepath;
  int currentStep = 0;

  final name = TextEditingController();
  final descriptionfield = TextEditingController();
  final descriptionfield2 = TextEditingController();

  @override
  void initState() {
    Provider.of<CategoriesViewModel>(context, listen: false)
        .FetchAllCategories();
    Provider.of<EventsViewModel>(context, listen: false);

    super.initState();
  }

  var dataimage = ImagesViewModel(imagesRepository: ImagesApi());

  final ImagePicker _picker = ImagePicker();
  List<XFile>? _imageFileList;
  dynamic _pickImageError;

  _onStepCancel() {
    currentStep == 0
        ? null
        : setState(() {
            currentStep -= 1;
          });
  }

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
    categories =
        Provider.of<CategoriesViewModel>(context, listen: true).categories;
    var provider = Provider.of<EventsViewModel>(context, listen: true);

    _onStepContinue() async {
      String namestring = name.text.trim();
      String description = descriptionfield.text.trim();
      final isLastStep = currentStep == getSteps().length - 1;
      if (isLastStep) {
        var event = {
          "category_id": 1,
          "observation_id": 21,
          "libelle": namestring,
          "description": description,
          "prix": _currentSliderValue.toInt(),
          "date_heure": _dataTime.toString(),
          "adresse": "Stade du 26 Mars",
          "nbre_tichet": 1000,
          "status": "statut",
          "image": "imagepath"
        };
        AddEventModel eventformJson = AddEventModel.fromJson(event);
        setState(() {
          provider.AddEvent(eventformJson);
        });

        if (provider.back) {
          print("Eventadded ");
          Navigator.of(context).pop();
        }
      } else {
        setState(() => currentStep += 1);
      }
    }

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
        body: Theme(
          data: ThemeData(
              canvasColor: Colors.white,
              shadowColor: Colors.white,
              colorScheme: const ColorScheme.light(
                  primary: Color.fromARGB(255, 112, 3, 118))),
          child: Stepper(
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  currentStep != 0
                      ? Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: InkWell(
                              onTap: details.onStepCancel,
                              child: Button(
                                text: currentStep == 0 ? "CANCEL" : "RETOURN",
                                fontSize: fontSizemediumbutton,
                                gradientbackground: gradientbackground,
                                height: heightmediumbutton,
                                width: widthmediumbutton,
                                fontWeight: FontWeight.normal,
                                textcolor: Colors.white,
                              ),
                            ),
                          ),
                        )
                      : SizedBox(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: InkWell(
                        onTap: details.onStepContinue,
                        child: Button(
                          text: currentStep == 2 ? "APPLIQUER" : "NEXT",
                          fontSize: fontSizemediumbutton,
                          gradientbackground: gradientbackground,
                          height: heightmediumbutton,
                          width: widthmediumbutton,
                          fontWeight: FontWeight.normal,
                          textcolor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
            steps: getSteps(),
            elevation: 0,
            type: StepperType.horizontal,
            currentStep: currentStep,
            onStepContinue: _onStepContinue,
            onStepCancel: _onStepCancel,
          ),
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
                  controller: name,
                  decoration: textFieldDecoration(
                    "Nom de levenment",
                    "entre le nom de levenment",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Nom de levenment";
                    } 
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () async {
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
                child: Button(
                    gradientbackground: gradientbackground,
                    text: "Parcourire ce calendrier",
                    textcolor: Colors.white,
                    height: 50,
                    width: 200,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 10,
              ),
              Text('$_dataTime'),
              const SizedBox(
                height: 10,
              ),
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
                    } 
                  },
                  onChanged: (text) {
                    prixfield = 7;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
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
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
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
                            libelle: categories?[index].libelle,
                            backgroundColor: selectedIndex == index
                                ? const Color(0xffD2286A)
                                : Colors.grey,
                          ),
                        )),
              ),
              Column(
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
              SizedBox(
                width: widthbigbutton,
                height: heightbigbutton,
                child: TextFormField(
                  controller: descriptionfield,
                  decoration: textFieldDecoration(
                    "publicite",
                    "entre le publicite",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "entre publicite";
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
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
                  controller: descriptionfield2,
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  decoration: textFieldDecoration(
                    "publicite",
                    "entre le publicite",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "entre publicite";
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              )
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
                child: TextAirbnbCereal(
                  title: "choisir une photo de levenement ",
                  fontWeight: FontWeight.w200,
                  color: Colors.black,
                  size: 18,
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
            ],
          ),
        )
      ];
}
