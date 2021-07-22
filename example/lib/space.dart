import 'package:flutter/material.dart';
import 'package:flutter_antd/flutter_antd.dart';

import 'widgets.dart';

class SpacePage extends StatelessWidget {
  const SpacePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkbox')),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        const GroupTitle('Basic Usage'),
        const Space(children: [
          Text('Space'),
          Button(type: ButtonType.primary, text: 'Button'),
          Button(text: 'Confirm'),
        ]),
        const SizedBox(height: 32),
        const GroupTitle('Vertical Space'),
        const Space(
          direction: Axis.vertical,
          align: CrossAxisAlignment.start,
          children: [
            Text('Space'),
            SizedBox(
              width: 80,
              child: Button(type: ButtonType.primary, text: 'Button'),
            ),
            SizedBox(width: 80, child: Button(text: 'Confirm')),
          ],
        ),
        const SizedBox(height: 32),
        const GroupTitle('Align'),
        Wrap(spacing: 8, runSpacing: 8, children: const [
          SpaceAlign('center'),
          SpaceAlign('start'),
          SpaceAlign('end'),
        ]),
        const SizedBox(height: 32),
        const GroupTitle('Wrap'),
        Space(
          wrap: true,
          children: List.generate(20, (i) {
            return const SizedBox(width: 60, child: Button(text: 'Button'));
          }).toList(),
        ),
        const SizedBox(height: 32),
        const GroupTitle('Split'),
        const Space(
          split: SizedBox(height: 14, child: VerticalDivider(thickness: 0.5)),
          children: [Text('Space'), Text('Space'), Text('Space')],
        ),
      ]),
    );
  }
}

class SpaceAlign extends StatelessWidget {
  final String align;

  const SpaceAlign(this.align);

  @override
  Widget build(BuildContext context) {
    const map = {
      'center': CrossAxisAlignment.center,
      'start': CrossAxisAlignment.start,
      'end': CrossAxisAlignment.end,
    };
    return Container(
      height: 80,
      width: 200,
      decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
      padding: const EdgeInsets.all(8),
      child: Space(align: map[align]!, children: [
        Text(align),
        const Button(type: ButtonType.primary, text: 'Primary'),
        Expanded(
          child: Container(
            color: Theme.of(context).splashColor,
            height: double.infinity,
            alignment: Alignment.center,
            child: const Text('Block'),
          ),
        ),
      ]),
    );
  }
}
