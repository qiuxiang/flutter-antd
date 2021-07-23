import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'radio.dart';

class RadioOption<T> {
  final T value;
  final String label;
  final Widget? labelWidget;
  final bool disabled;

  const RadioOption({
    required this.value,
    this.label = '',
    this.labelWidget,
    this.disabled = false,
  });
}

enum RadioOptionType { button }

class RadioGroup<T extends Object> extends StatefulWidget {
  final List<RadioOption<T>> options;
  final T? defaultValue;
  final T? value;
  final bool disabled;
  final void Function(T)? onChange;
  final RadioOptionType? optionType;

  const RadioGroup({
    required this.options,
    this.onChange,
    this.defaultValue,
    this.value,
    this.disabled = false,
    this.optionType,
  });

  @override
  _RadioGroupState<T> createState() => _RadioGroupState<T>();
}

class _RadioGroupState<T extends Object> extends State<RadioGroup<T>> {
  T? value;

  @override
  void initState() {
    super.initState();
    value = widget.defaultValue;
  }

  Widget buildItem(RadioOption i) {
    final theme = Theme.of(context);
    Color? color;
    if (i.disabled) {
      color = theme.disabledColor;
    } else if (i.value != value) {
      color = theme.textTheme.bodyText2?.color;
    }

    return Container(
      height: 32,
      color: i.disabled ? theme.disabledColor.withOpacity(0.1) : null,
      alignment: Alignment.center,
      child: DefaultTextStyle(
        style: TextStyle(color: color),
        child: i.labelWidget ?? Text(i.label),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.optionType == RadioOptionType.button) {
      return CupertinoSegmentedControl<T>(
        children: {for (final i in widget.options) i.value: buildItem(i)},
        borderColor: Theme.of(context).dividerColor,
        padding: EdgeInsets.zero,
        groupValue: value,
        onValueChanged: onChanged,
      );
    }
    return Wrap(
      spacing: 16,
      children: widget.options.map((i) {
        return AntdRadio<T>(
          label: i.label,
          labelWidget: i.labelWidget,
          value: i.value,
          checked: i.value == value,
          disabled: widget.disabled || i.disabled,
          onChanged: onChanged,
        );
      }).toList(),
    );
  }

  void onChanged(T? value) {
    if (widget.optionType == RadioOptionType.button) {
      final item = widget.options.firstWhere((i) => i.value == value);
      if (item.disabled) return;
    }
    setState(() => this.value = value);
    widget.onChange?.call(value!);
  }
}
