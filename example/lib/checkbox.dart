import 'package:flutter/material.dart';
import 'package:flutter_antd/flutter_antd.dart';

class CheckboxPage extends StatelessWidget {
  const CheckboxPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkbox')),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        const Title('Basic'),
        Row(children: [
          AntdCheckbox(
            label: 'Checkbox',
            onChange: (value) => print('checked = $value'),
          ),
        ]),
      ]),
    );
  }
}

class Title extends StatelessWidget {
  final String title;
  const Title(this.title);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: Theme.of(context).textTheme.headline6),
      const SizedBox(height: 16),
    ]);
  }
}
