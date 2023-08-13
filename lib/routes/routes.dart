import 'package:first_attempt/pages/favs.dart';
import 'package:first_attempt/pages/home.dart';
import 'package:get/get.dart';

class AppPages {
  static String getStarted = '/';
  static String home = '/home';
  static String favs = '/favs';

  static getHome() => home;
  static getFavs() => favs;
  static getGetStarted() => getStarted;

  static List<GetPage> routes = [
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: favs, page: () => FavoritesScreen())
  ];
}
