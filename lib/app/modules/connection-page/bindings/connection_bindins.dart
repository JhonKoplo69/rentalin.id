import 'package:get/get.dart';

import '../controllers/connections_controller.dart';

class ConnectionBindins extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConnectionController>(
      () => ConnectionController(),
    );
  }
}
