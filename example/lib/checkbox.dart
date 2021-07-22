import 'package:flutter/material.dart';
import 'package:flutter_antd/flutter_antd.dart';
import 'package:get/get.dart';

import 'widgets.dart';

class CheckboxPage extends StatelessWidget {
  const CheckboxPage();

  @override
  Widget build(BuildContext context) {
    final state = CheckboxPageState();
    Get.put(state);
    return Scaffold(
      appBar: AppBar(title: const Text('Checkbox')),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        const GroupTitle('Basic'),
        Row(children: [
          AntdCheckbox(
            label: 'Checkbox',
            onChange: (value) => print('checked = $value'),
          ),
        ]),
        const SizedBox(height: 32),
        const GroupTitle('Disabled'),
        Row(children: const [
          AntdCheckbox(disabled: true),
          SizedBox(width: 8),
          AntdCheckbox(disabled: true, checked: true),
        ]),
        const SizedBox(height: 32),
        const GroupTitle('Controlled Checkbox'),
        Obx(() {
          final checked = state.checked.isTrue ? 'Checked' : 'Unchecked';
          final disabled = state.disabled.isTrue ? 'Disabled' : 'Enabled';
          return AntdCheckbox(
            label: '$checked-$disabled',
            checked: state.checked.value,
            disabled: state.disabled.value,
            onChange: (value) => state.checked.value = value,
          );
        }),
        const SizedBox(height: 16),
        Row(children: [
          Obx(() {
            return Button(
              type: ButtonType.primary,
              text: state.checked.isTrue ? 'Uncheck' : 'Check',
              onClick: state.checked.toggle,
            );
          }),
          const SizedBox(width: 8),
          Obx(() {
            return Button(
              type: ButtonType.primary,
              text: state.disabled.isTrue ? 'Enable' : 'Disable',
              onClick: state.disabled.toggle,
            );
          }),
        ]),
      ]),
    );
  }
}

class CheckboxPageState extends GetxController {
  final checked = false.obs;
  final disabled = false.obs;
}
