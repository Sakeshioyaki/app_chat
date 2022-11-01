import 'package:flutter_base/ui/pages/intro/intro_page.dart';
import 'package:flutter_base/ui/pages/sign_in/sign_in_page.dart';
import 'package:get/get.dart';

import '../ui/pages/main/main_page.dart';
import '../ui/pages/splash/splash_page.dart';

class RouteConfig {
  RouteConfig._();

  ///main page
  static const String splash = "/splash";
  static const String intro = "/intro";
  static const String main = "/main";
  static const String signIn = "/signIn";

  ///Alias ​​mapping page
  static final List<GetPage> getPages = [
    GetPage(name: splash, page: () => const SplashPage()),
    GetPage(name: intro, page: () => const IntroPage()),
    GetPage(name: main, page: () => const MainPage()),
    GetPage(name: signIn, page: () => const SignInPage()),
  ];
}
