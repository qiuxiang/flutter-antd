import 'package:flutter/material.dart';
import 'package:flutter_antd/flutter_antd.dart';
import 'package:get/get.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage();

  @override
  Widget build(BuildContext context) {
    final state = ButtonPageState();
    Get.put(state);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button'),
      ),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        Text('Type', style: context.textTheme.headline6),
        const SizedBox(height: 16),
        Row(children: [
          Button(type: ButtonType.primary, text: 'Primary Button'),
          const SizedBox(width: 8),
          Button(text: 'Default Button'),
        ]),
        const SizedBox(height: 8),
        Row(children: [
          Button(type: ButtonType.text, text: 'Text Button'),
          const SizedBox(width: 8),
          Button(type: ButtonType.link, text: 'Link Button'),
        ]),
        const Divider(height: 32),
        Text('Icon', style: context.textTheme.headline6),
        const SizedBox(height: 16),
        Row(children: [
          Button(
            type: ButtonType.primary,
            icon: Icons.search,
            shape: ButtonShape.circle,
          ),
          const SizedBox(width: 8),
          Button(
            type: ButtonType.primary,
            text: 'A',
            shape: ButtonShape.circle,
          ),
          const SizedBox(width: 8),
          Button(type: ButtonType.primary, icon: Icons.search, text: 'Search'),
        ]),
        const SizedBox(height: 8),
        Row(children: [
          Button(icon: Icons.search),
          const SizedBox(width: 8),
          Button(
            text: 'A',
            shape: ButtonShape.circle,
          ),
          const SizedBox(width: 8),
          Button(icon: Icons.search, text: 'Search'),
        ]),
        const Divider(height: 32),
        Text('Disabled', style: context.textTheme.headline6),
        const SizedBox(height: 16),
        Row(children: [
          Button(type: ButtonType.primary, text: 'Primary'),
          const SizedBox(width: 8),
          Button(type: ButtonType.primary, text: 'Primary', disabled: true),
        ]),
        const SizedBox(height: 8),
        Row(children: [
          Button(text: 'Default'),
          const SizedBox(width: 8),
          Button(text: 'Default', disabled: true),
        ]),
        const SizedBox(height: 8),
        Row(children: [
          Button(type: ButtonType.text, text: 'Text'),
          const SizedBox(width: 8),
          Button(type: ButtonType.text, text: 'Text', disabled: true),
        ]),
        const SizedBox(height: 8),
        Row(children: [
          Button(type: ButtonType.link, text: 'Link'),
          const SizedBox(width: 8),
          Button(type: ButtonType.link, text: 'Link', disabled: true),
        ]),
        const Divider(height: 32),
        Text('Loading', style: context.textTheme.headline6),
        const SizedBox(height: 16),
        Row(children: [
          Button(text: 'Loading', loading: true),
          const SizedBox(width: 8),
          Button(type: ButtonType.primary, text: 'Loading', loading: true),
          const SizedBox(width: 8),
          Button(type: ButtonType.primary, loading: true),
        ]),
        const SizedBox(height: 8),
        Row(children: [
          Obx(() {
            return Button(
              type: ButtonType.primary,
              text: 'Click me!',
              loading: state.loading1.value,
              onClick: () => state.loading(state.loading1),
            );
          }),
          const SizedBox(width: 8),
          Obx(() {
            return Button(
              type: ButtonType.primary,
              icon: Icons.power_settings_new,
              text: 'Click me!',
              loading: state.loading2.value,
              onClick: () => state.loading(state.loading2),
            );
          }),
          const SizedBox(width: 8),
          Obx(() {
            return Button(
              type: ButtonType.primary,
              icon: Icons.power_settings_new,
              loading: state.loading3.value,
              onClick: () => state.loading(state.loading3),
            );
          }),
        ]),
        const Divider(height: 32),
        Text('Danger', style: context.textTheme.headline6),
        const SizedBox(height: 16),
        Row(children: [
          Button(type: ButtonType.primary, text: 'Primary', danger: true),
          const SizedBox(width: 8),
          Button(text: 'Default', danger: true),
          const SizedBox(width: 8),
          Button(type: ButtonType.text, text: 'Text', danger: true),
          const SizedBox(width: 8),
          Button(type: ButtonType.link, text: 'Link', danger: true),
        ]),
      ]),
    );
  }
}

class ButtonPageState extends GetxController {
  final loading1 = false.obs;
  final loading2 = false.obs;
  final loading3 = false.obs;

  void loading(RxBool value) async {
    value.toggle();
    await Future.delayed(const Duration(seconds: 2));
    value.toggle();
  }
}
