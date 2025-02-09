import 'package:evently/event/core/app_assets.dart';
import 'package:evently/event/core/app_colors.dart';
import 'package:evently/event/core/provider/theme_provider.dart';
import 'package:evently/event/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = "/onBoarding";

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late ThemeProvider themeProvider;
  late AppLocalizations appLocalizations;

  final PageController pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context);
    appLocalizations =
        AppLocalizations.of(context) ?? AppLocalizations.of(context)!;

    final List<Map<String, String>> onboardingData = [
      {
        "image": AppAssets.onBoardingPage1,
        "imageDark": AppAssets.onBoardingPage1,
        "title": appLocalizations.title1,
        "description": appLocalizations.des1
      },
      {
        "image": AppAssets.onBoardingPage2Light,
        "imageDark": AppAssets.onBoardingPage2Dark,
        "title": appLocalizations.title2,
        "description": appLocalizations.des2
      },
      {
        "image": AppAssets.onBoardingPage3Light,
        "imageDark": AppAssets.onBoardingPage3Dark,
        "title": appLocalizations.title3,
        "description": appLocalizations.des3
      },
    ];

    return SafeArea(
      child: Scaffold(
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
                  return (buildScreen(context, onboardingData, index));
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
              flex: 4,
              child: Image.asset(
                themeProvider.isDark()
                    ? onboardingData[index]["imageDark"]!
                    : onboardingData[index]["image"]!,
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.height * 0.82,
              )),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  onboardingData[index]["title"]!,
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          Text(
            onboardingData[index]["description"]!,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyLarge,
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
                        backgroundColor: Colors.transparent,
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
                        context, LoginScreen.routeName);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: AppColors.purple, width: 1), // Purple border
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
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
