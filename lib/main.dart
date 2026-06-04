import 'package:flutter/material.dart';
import 'app/theme/app_theme.dart';
import 'features/home/screens/home_screen.dart';
import 'features/movies/screens/movies_screen.dart';
import 'features/series/screens/series_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prime Video',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/peliculas': (context) => const MoviesScreen(),
        '/series': (context) => const SeriesScreen(),
      },
    );
  }
}
