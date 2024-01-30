import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thbeer/data/shared_preferences.dart';
import 'package:thbeer/screens/onboarding_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await BookmarksManager().init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: FlexColorScheme(
          fontFamily: GoogleFonts.rubik().fontFamily,
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(103, 44, 188, 1)),
        ).toTheme,
        home: const OnBoardingScreen());
  }
}
