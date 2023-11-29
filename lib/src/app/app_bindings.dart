import 'package:get/get.dart';

import '../data/data.dart';
import '../modules/modules.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkService(), permanent: true);
    Get.put(HomeRepository(), permanent: true);
    Get.put(HomeController(), permanent: true);
  }
}
