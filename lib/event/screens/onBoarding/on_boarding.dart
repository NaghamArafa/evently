import 'package:evently/event/screens/home/home_screen.dart';
import 'package:evently/event/utl/app_assets.dart';
import 'package:evently/event/utl/app_colors.dart';
import 'package:evently/event/utl/app_styles.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = "/onBoarding";

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  int currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": AppAssets.onBoardingPage1,
      "title": "Find Events That Inspire You",
      "description":
          "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you."
    },
    {
      "image": AppAssets.onBoardingPage2Light,
      "title": "Effortless Event Planning",
      "description":
          "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests."
    },
    {
      "image": AppAssets.onBoardingPage3Light,
      "title": "Connect with Friends & Share Moments",
      "description":
          "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories."
    },
  ];

  void nextPage() {
    if (currentIndex < onboardingData.length - 1) {
      pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return buildScreen(context, onboardingData, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildScreen(BuildContext context,
      List<Map<String, String>> onboardingData, int index) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          Image.asset(
            AppAssets.appHorizontalLogoImage,
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          SizedBox(height: 40),
          Expanded(
              child: Image.asset(
            onboardingData[index]["image"]!,
            fit: BoxFit.fill,
            height: MediaQuery.of(context).size.height * 0.42,
          )),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                onboardingData[index]["title"]!,
                style: AppStyles.titleStyle,
                textAlign: TextAlign.start,
              ),
            ],
          ),
          SizedBox(height: 40),
          Text(
            onboardingData[index]["description"]!,
            textAlign: TextAlign.start,
            style: AppStyles.desStyle,
          ),
          Spacer(),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            currentIndex > 0
                ? TextButton(
                    onPressed: () {
                      if (currentIndex > 0) {
                        pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: AppColors.purple, width: 1), // Purple border
                      ),
                      child: CircleAvatar(
                        backgroundColor: AppColors.white,
                        child: Icon(Icons.arrow_back_outlined,
                            color: AppColors.purple),
                      ),
                    ))
                : Container(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(3, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    width: currentIndex == index ? 16.0 : 8.0,
                    height: 8.0,
                    decoration: BoxDecoration(
                      color: currentIndex == index
                          ? AppColors.purple
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  );
                }),
              ),
            ),
            TextButton(
                onPressed: () {
                  if (currentIndex < 2) {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    Navigator.pushReplacementNamed(
                        context, HomeScreen.routeName);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: AppColors.purple, width: 1), // Purple border
                  ),
                  child: CircleAvatar(
                    backgroundColor: AppColors.white,
                    child: Icon(Icons.arrow_forward_outlined,
                        color: AppColors.purple),
                  ),
                )),
          ]),
        ],
      ),
    );
  }
}
