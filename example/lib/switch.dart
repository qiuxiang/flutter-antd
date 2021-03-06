import 'package:flutter/material.dart';
import 'package:flutter_antd/flutter_antd.dart';

import 'widgets.dart';

// ignore: avoid_positional_boolean_parameters
void onChange(bool value) => print('switch to $value');

class SwitchPage extends StatelessWidget {
  const SwitchPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Switch')),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        const GroupTitle('Basic'),
        Row(children: [
          const AntdSwitch(defaultChecked: true, onChange: onChange),
          const SizedBox(width: 8),
          const AntdSwitch(onChange: onChange),
        ]),
        const SizedBox(height: 32),
        const GroupTitle('Text & icon'),
        const AntdSwitch(
          checkedChildren: Text('开启'),
          unCheckedChildren: Text('关闭'),
          defaultChecked: true,
        ),
        const SizedBox(height: 8),
        const AntdSwitch(
          checkedChildren: Text('1'),
          unCheckedChildren: Text('0'),
        ),
        const SizedBox(height: 8),
        const AntdSwitch(
          checkedChildren: Icon(Icons.check),
          unCheckedChildren: Icon(Icons.close),
          defaultChecked: true,
        ),
        const SizedBox(height: 32),
      ]),
    );
  }
}
