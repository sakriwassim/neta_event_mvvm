import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/size_config.dart';
import '../model/items_model.dart';
import '../utils/colors.dart';
import '../components.dart';

class IntoScreen extends StatefulWidget {
  const IntoScreen({Key? key}) : super(key: key);

  @override
  State<IntoScreen> createState() => _IntoScreenState();
}

class _IntoScreenState extends State<IntoScreen> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Widget animation(
    int index,
    int delay,
    Widget child,
  ) {
    if (index == 1) {
      return FadeInDown(
        delay: Duration(milliseconds: delay),
        child: child,
      );
    }
    return FadeInUp(
      delay: Duration(milliseconds: delay),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: getProportionateScreenHeight(500),
                //color: Colors.red,
                child: Center(
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: listOfItems.length,
                    onPageChanged: (newIndex) {
                      setState(() {
                        currentIndex = newIndex;
                      });
                    },
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: ((context, index) {
                      return SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            /// IMG
                            Expanded(
                              child: Center(
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  child: animation(
                                    index,
                                    100,
                                    Image.asset(listOfItems[index].img),
                                  ),
                                ),
                              ),
                            ),

                            /// TITLE TEXT
                            animation(
                                index,
                                300,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Text(
                                    listOfItems[index].title,
                                    style: GoogleFonts.lato(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 30,
                                        color: Colors.black),
                                  ),
                                )),

                            /// SUBTITLE TEXT
                            animation(
                              index,
                              500,
                              Text(
                                listOfItems[index].subTitle,
                                textAlign: TextAlign.center,
                                style: textTheme.headline2,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(200),
                // color: Colors.grey,
                child: Column(
                  children: [
                    /// PAGE INDICATOR
                    SmoothPageIndicator(
                      controller: pageController,
                      count: listOfItems.length,
                      effect: const ExpandingDotsEffect(
                        spacing: 6.0,
                        radius: 10.0,
                        dotWidth: 10.0,
                        dotHeight: 10.0,
                        expansionFactor: 3.8,
                        dotColor: Colors.grey,
                        activeDotColor: MyColors.btnColor,
                      ),
                      onDotClicked: (newIndex) {
                        setState(() {
                          currentIndex = newIndex;
                          pageController.animateToPage(newIndex,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease);
                        });
                      },
                    ),
                    currentIndex == 2

                        /// GET STARTED BTN
                        ? GetStartBtn(size: size, textTheme: textTheme)

                        /// SKIP BTN
                        : SkipBtn(
                            size: size,
                            textTheme: textTheme,
                            onTap: () {
                              setState(() {
                                
                                pageController.animateToPage(2,
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    curve: Curves.fastOutSlowIn);
                              });
                            },
                          )
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
