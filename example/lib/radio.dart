import 'package:flutter/material.dart';
import 'package:flutter_antd/flutter_antd.dart';
import 'package:get/get.dart';

import 'widgets.dart';

class RadioPage extends StatelessWidget {
  const RadioPage();

  @override
  Widget build(BuildContext context) {
    final state = RadioPageState();
    Get.put(state);
    return Scaffold(
      appBar: AppBar(title: const Text('Radio')),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        const GroupTitle('Basic'),
        const AntdRadio(label: 'Radio'),
        const SizedBox(height: 32),
        const GroupTitle('Disabled'),
        Obx(() {
          final disabled = state.disabled.value;
          return Row(children: [
            AntdRadio(label: 'Disabled', disabled: disabled),
            const SizedBox(width: 8),
            AntdRadio(label: 'Disabled', checked: true, disabled: disabled),
          ]);
        }),
        const SizedBox(height: 16),
        Row(children: [
          Button(
            type: ButtonType.primary,
            text: 'Toggle disabled',
            onClick: state.disabled.toggle,
          ),
        ]),
        const SizedBox(height: 32),
        const GroupTitle('Radio Group'),
        RadioGroup<String>(
          options: const [
            RadioOption(label: 'A', value: 'A'),
            RadioOption(label: 'B', value: 'B'),
            RadioOption(label: 'C', value: 'C'),
            RadioOption(label: 'D', value: 'D', disabled: false),
          ],
          defaultValue: 'A',
          onChange: (value) => print('radio checked $value'),
        ),
        const SizedBox(height: 32),
        const GroupTitle('Checkbox Group'),
        Row(children: const [
          SizedBox(
            width: 200,
            child: RadioGroup<String>(
              options: [
                RadioOption(label: 'Apple', value: 'Apple'),
                RadioOption(label: 'Pear', value: 'Pear'),
                RadioOption(label: 'Orange', value: 'Orange', disabled: true),
              ],
              defaultValue: 'Apple',
              optionType: RadioOptionType.button,
            ),
          ),
        ]),
      ]),
    );
  }
}

class RadioPageState extends GetxController {
  final disabled = true.obs;
}
