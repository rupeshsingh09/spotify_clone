import 'package:flutter/material.dart';
import 'package:spotify_clone/domain/app_routes.dart';
import 'package:spotify_clone/ui/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash Screen',
      theme: ThemeData(
        fontFamily: 'avaenic',

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      routes: AppRoutes.getRoutes(),
      initialRoute: AppRoutes.splash_page,
    );
  }
}
