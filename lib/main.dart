import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livo_project/modules/auth/views/login_customer_page.dart';
import 'package:livo_project/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginCustomerPage(),
      getPages: AppRoutes.pages,
      defaultTransition: Transition.noTransition,
    );
  }
}



