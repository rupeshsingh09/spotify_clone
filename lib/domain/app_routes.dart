import 'package:flutter/cupertino.dart';
import 'package:spotify_clone/ui/create_account/create_account_page.dart';
import 'package:spotify_clone/ui/dashboard/dashboard_page.dart';
import 'package:spotify_clone/ui/intro/choose_artist_page.dart';
import 'package:spotify_clone/ui/intro/choose_podcast_page.dart';
import 'package:spotify_clone/ui/intro/intro_page.dart';
import 'package:spotify_clone/ui/splash/splash_page.dart';

class AppRoutes{
  static const String splash_page  = '/splash';
  static const String intro_page = '/intro';
  static const String create_account_page = '/create_account';
  static const String choose_artist_page = '/choose_artist';
  static const String choose_podcast_page = '/choose_podcast';
  static const String dashboard_page = '/dashboard_page';



   static Map< String, Widget Function(BuildContext)> getRoutes() => {
    splash_page : (context) => SplashPage(),
    intro_page : (context) => IntroPage(),
     create_account_page : (context) => CreateAccountPage(),
     choose_artist_page : (context) => ChooseArtistPage(),
     choose_podcast_page : (context) => ChoosePodcastPage(),
     dashboard_page : (context) => DashboardPage(),
  };
}