import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../splash/view.dart';

class OnBoard {
  final String image, title, description;

  OnBoard({
    required this.image,
    required this.title,
    required this.description,
  });
}

// OnBoarding content list
final List<OnBoard> demoData = [
  OnBoard(
    image: "assets/images/onBorad1.png",
    title: "Title 01",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  ),
  OnBoard(
    image: "assets/images/onBorad2.png",
    title: "Title 02",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  ),
];

// OnBoardingScreen
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    // _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
    //   if (_pageIndex < 1) {
    //     _pageIndex++;
    //   } else {
    //     _pageIndex = 0;
    //   }
    //   _pageController.animateToPage(
    //     _pageIndex,
    //     duration: const Duration(milliseconds: 350),
    //     curve: Curves.easeIn,
    //   );
    // });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemCount: demoData.length,
                  controller: _pageController,
                  itemBuilder: (context, index) => OnBoardContent(
                    title: demoData[index].title,
                    description: demoData[index].description,
                    image: demoData[index].image,
                  ),
                ),
              ),
              // Indicator area

              // Privacy policy area

              // White space
              const SizedBox(
                height: 16,
              ),
              // Button area
              InkWell(
                onTap: () {
                  if (_pageIndex == 0) {
                    _pageIndex++;
                  } else {
                    Get.to(const SplashScreen());
                  }
                  _pageController.animateToPage(
                    _pageIndex,
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeIn,
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 48),
                  height: Get.height * 0.075,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color:const Color(0xffF4ADCB),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      _pageIndex == 0 ? "التالي" : "ابدا الان",
                      style:const TextStyle(
                        fontFamily: "ExpoArabic-Book",
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// OnBoarding area widget
class OnBoardContent extends StatelessWidget {
  OnBoardContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  String image;
  String title;
  String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        const Spacer(),
        Stack(
          children: [
            SizedBox(
                height: 500,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(image)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 200,
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 100.0),
                      child: Image.asset(
                        "assets/images/logo_background.png",
                      ),
                    )),
              ],
            ),
          ],
        ),
        const Text(
          "كل شيئ في مكان واحد",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "ExpoArabic-Book",
            color: Color(0xFF60AAE5),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "احصلي على كل ما تبحثين عنه قبل عرسك بأسهل طريقة وأفضل جودة",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "ExpoArabic-Book",
            color: Colors.grey,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        // const Spacer(),
      ],
    );
  }
}

// Dot indicator widget
// classDotIndicator extends StatelessWidget {
//   const DotIndicator({
//     this.isActive = false,
//     super.key,
//   });

//   final bool isActive;

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       height: 8,
//       width: isActive ? 24 : 8,
//       decoration: BoxDecoration(
//         color: isActive ? Colors.amber : Colors.white,
//         border: isActive ? null : Border.all(color: Colors.amber),
//         borderRadius: const BorderRadius.all(
//           Radius.circular(12),
//         ),
//       ),
//     );
//   }
// }
 