import 'package:flutter/material.dart';

class GroupTitle extends StatelessWidget {
  final String title;
  const GroupTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: Theme.of(context).textTheme.headline6),
      const SizedBox(height: 16),
    ]);
  }
}
