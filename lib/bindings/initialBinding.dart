import 'package:get/get.dart';
import 'package:test_mottu/getContent.controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GetContentController());
  }
}
