import 'package:get/get.dart';
import 'package:movie_app/src/core/routes/app_routes.dart';
import 'package:movie_app/src/modules/modules.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashView(),
    ),
    GetPage(
      name: AppRoutes.info,
      page: () => InfoView(),
    ),
  ];
}
