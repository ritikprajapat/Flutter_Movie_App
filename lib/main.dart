import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/src/app/app_bindings.dart';
import 'package:movie_app/src/core/routes/app_pages.dart';
import 'package:movie_app/src/core/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(),
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
    );
  }
}
