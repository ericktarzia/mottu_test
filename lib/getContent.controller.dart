import 'package:flutter/services.dart';
import 'package:get/get.dart';

class GetContentController extends GetxController {
  final getContentChannel = const MethodChannel('getContent');
  final loading = false.obs;

  final content = <String>[].obs;

  @override
  void onInit() {
    getTabContent();
    super.onInit();
  }

  void getTabContent() async {
    loading.value = true;
    for (var i = 0; i < 3; i++) {
      String? result =
          await getContentChannel.invokeMethod<String>('getContent', i);
      content.add(result ?? '---');
    }

    loading.value = false;
  }
}
