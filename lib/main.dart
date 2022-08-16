import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_mottu/bindings/initialBinding.dart';
import 'package:test_mottu/getContent.controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      initialBinding: InitialBinding(),
    );
  }
}

class MyHomePage extends GetView<GetContentController> {
  MyHomePage({Key? key}) : super(key: key);

  final _tabs = <Widget>[
    const Text('tab1'),
    const Text('tab2'),
    const Text('tab3')
  ];

  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('MOTTU TEST'),
          bottom: TabBar(tabs: _tabs),
        ),
        body: Obx(
          () => controller.content.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : TabBarView(children: [
                  for (String text in controller.content)
                    Center(
                      child: Card(
                          child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(text),
                      )),
                    )
                ]),
        ),
      ));
}
