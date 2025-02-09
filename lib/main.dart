import 'package:evently/event/core/provider/locale_provider.dart';
import 'package:evently/event/core/provider/theme_provider.dart';
import 'package:evently/event/core/provider/user_provider.dart';
import 'package:evently/event/core/themes/app_theme.dart';
import 'package:evently/event/screens/add_event/add_event.dart';
import 'package:evently/event/screens/home/home_screen.dart';
import 'package:evently/event/screens/login/login_screen.dart';
import 'package:evently/event/screens/onBoarding/on_boarding.dart';
import 'package:evently/event/screens/setup/onboarding_setpu_screen.dart';
import 'package:evently/event/screens/signup_screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => LocaleProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => UserProvider(),
      )
    ], child: MyApp()),
  );
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  late ThemeProvider themeProvider;
  late LocaleProvider localeProvider;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context);
    localeProvider = Provider.of<LocaleProvider>(context);

    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(localeProvider.locale),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      routes: {
        OnboardingSetupScreen.routeName: (_) => OnboardingSetupScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        OnBoardingScreen.routeName: (_) => OnBoardingScreen(),
        SignupScreen.routeName: (_) => SignupScreen(),
        AddEvent.routeName: (_) => AddEvent(),
      },
      initialRoute: OnboardingSetupScreen.routeName,
    );
  }
}
