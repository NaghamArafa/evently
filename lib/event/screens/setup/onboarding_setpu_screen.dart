import 'package:evently/event/core/app_assets.dart';
import 'package:evently/event/core/provider/theme_provider.dart';
import 'package:evently/event/screens/onBoarding/on_boarding.dart';
import 'package:evently/event/shared_widgets/language_switch.dart';
import 'package:evently/event/shared_widgets/theme_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class OnboardingSetupScreen extends StatelessWidget {
  static const String routeName = "/OnboardingSetupScreen";

  late ThemeProvider themeProvider;
  late AppLocalizations appLocalizations;

  OnboardingSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context);
    appLocalizations =
        AppLocalizations.of(context) ?? AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                AppAssets.appHorizontalLogoImage,
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              Expanded(
                child: Image.asset(themeProvider.isDark()
                    ? AppAssets.onBoardingDark
                    : AppAssets.onBoardingLight),
              ),
              const SizedBox(height: 16),
              Text(
                appLocalizations.personalizeYourExperience,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 16),
              Text(
                appLocalizations.setupScreenDescription,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    appLocalizations.language,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  LanguageSwitch()
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    appLocalizations.theme,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  ThemeSwitch(),
                ],
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, OnBoardingScreen.routeName);
                },
                child: Text(appLocalizations.letsStart),
              )
            ],
          ),
        ),
      ),
    );
  }
}
