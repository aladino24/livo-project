

import 'package:get/get.dart';
import 'package:livo_project/modules/auth/views/login_customer_page.dart';
import 'package:livo_project/modules/main/views/main_view.dart';
import 'package:livo_project/routes/routes_name.dart';

class AppRoutes{
  static final pages= [
      GetPage(name: RoutesName.main, page: () => MainView(), transition: Transition.fadeIn),
    GetPage(name: RoutesName.login, page: () => const LoginCustomerPage(), transition: Transition.fadeIn),
  ];
}