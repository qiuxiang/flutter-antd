import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  final List<Widget> children;
  final Axis direction;
  final CrossAxisAlignment align;
  final double size;
  final Widget? split;
  final bool wrap;
  final double runSpacing;

  const Space({
    required this.children,
    this.direction = Axis.horizontal,
    this.align = CrossAxisAlignment.center,
    this.size = SpaceSize.small,
    this.split,
    this.wrap = false,
    this.runSpacing = 16,
  });

  @override
  Widget build(BuildContext context) {
    if (wrap) {
      const map = {
        [CrossAxisAlignment.start]: WrapCrossAlignment.start,
        [CrossAxisAlignment.center]: WrapCrossAlignment.center,
        [CrossAxisAlignment.end]: WrapCrossAlignment.end,
      };
      return Wrap(
        direction: direction,
        runSpacing: runSpacing,
        children: buildChildren(split ?? buildSplit()),
        crossAxisAlignment: map[align] ?? WrapCrossAlignment.center,
      );
    }
    return Flex(
      direction: direction,
      children: buildChildren(split ?? buildSplit()),
      crossAxisAlignment: align,
      mainAxisSize: MainAxisSize.min,
    );
  }

  Widget buildSplit() {
    return SizedBox(
      width: direction == Axis.horizontal ? size : null,
      height: direction == Axis.vertical ? size : null,
    );
  }

  List<Widget> buildChildren(Widget split) {
    final items = <Widget>[];
    for (var i = 0; i < children.length; i += 1) {
      final item = children[i];
      if (i != 0) items.add(split);
      items.add(item);
    }
    return items;
  }
}

class SpaceSize {
  static const small = 8.0;
  static const middle = 16.0;
  static const large = 24.0;
}
