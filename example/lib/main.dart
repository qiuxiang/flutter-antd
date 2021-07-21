import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'button.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Example',
      darkTheme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widgets')),
      body: ListView(children: [
        ListTile(
          title: const Text('Button'),
          onTap: () => Get.to(() => const ButtonPage()),
        )
      ]),
    );
  }
}
