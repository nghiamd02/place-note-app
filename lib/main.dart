import 'package:fav_place_app/places_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 102, 6, 247),
  brightness: Brightness.dark,
  background: const Color.fromARGB(255, 56, 49, 66),
);

void main() => runApp(const ProviderScope(
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
          useMaterial3: true,
          scaffoldBackgroundColor: colorScheme.background,
          colorScheme: colorScheme,
          textTheme: GoogleFonts.latoTextTheme().copyWith(
            titleSmall: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
            ),
            titleMedium: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
            ),
            titleLarge: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
            ),
          )),
      home: PlacesList(),
    );
  }
}
