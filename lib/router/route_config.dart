import 'package:flutter_base/ui/messages/message_page.dart';
import 'package:flutter_base/ui/pages/home/home_page.dart';
import 'package:flutter_base/ui/pages/intro/intro_page.dart';
import 'package:flutter_base/ui/pages/sign_in/input_code/input_code_page.dart';
import 'package:flutter_base/ui/pages/sign_in/input_name/input_name_page.dart';
import 'package:flutter_base/ui/pages/sign_in/sign_in_page.dart';
import 'package:get/get.dart';

import '../ui/pages/splash/splash_page.dart';

class RouteConfig {
  RouteConfig._();

  ///main page
  static const String splash = "/splash";
  static const String intro = "/intro";
  static const String signIn = "/signIn";
  static const String inputCode = "/inputCode/:phone";
  static const String home = "/home";
  static const String message = "/message";
  static const String profilePage = "/ProfilePage";

  ///Alias ​​mapping page
  static final List<GetPage> getPages = [
    GetPage(name: splash, page: () => const SplashPage()),
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: intro, page: () => const IntroPage()),
    GetPage(name: signIn, page: () => const SignInPage()),
    GetPage(name: inputCode, page: () => InputCodePage(phone: Get.arguments)),
    GetPage(name: message, page: () => const MessagePage()),
    GetPage(name: profilePage, page: () => const ProfilePage()),
  ];
}
