import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'button.dart';
import 'checkbox.dart';
import 'radio.dart';
import 'space.dart';

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
        ),
        ListTile(
          title: const Text('Space'),
          onTap: () => Get.to(() => const SpacePage()),
        ),
        ListTile(
          title: const Text('Checkbox'),
          onTap: () => Get.to(() => const CheckboxPage()),
        ),
        ListTile(
          title: const Text('Radio'),
          onTap: () => Get.to(() => const RadioPage()),
        ),
      ]),
    );
  }
}
