

import 'package:get/get.dart';
import 'package:livo_project/modules/auth/views/login_customer_page.dart';
import 'package:livo_project/modules/auth/views/splash_screen.dart';
import 'package:livo_project/routes/routes_name.dart';

class AppRoutes{
  static final pages= [
    GetPage(name: RoutesName.splash, page: () => const SplashScreen(), transition: Transition.fadeIn),
    GetPage(name: RoutesName.login, page: () => LoginCustomerPage(), transition: Transition.fadeIn)
  ];
}