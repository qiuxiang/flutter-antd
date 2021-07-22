import 'package:flutter/material.dart';

import 'checkbox.dart';

class CheckboxOption<T> {
  final T value;
  final String label;
  final Widget? labelWidget;

  const CheckboxOption({
    required this.value,
    this.label = '',
    this.labelWidget,
  });
}

class CheckboxGroup<T> extends StatefulWidget {
  final List<CheckboxOption<T>> options;
  final List<T> defaultValue;
  final bool disabled;
  final void Function(List<T>)? onChange;

  const CheckboxGroup({
    required this.options,
    this.onChange,
    this.defaultValue = const [],
    this.disabled = false,
  });

  @override
  _CheckboxGroupState<T> createState() => _CheckboxGroupState<T>();
}

class _CheckboxGroupState<T> extends State<CheckboxGroup<T>> {
  List<T> values = [];

  @override
  void initState() {
    super.initState();
    values = widget.defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      children: widget.options.map((i) {
        return AntdCheckbox(
          label: i.label,
          labelWidget: i.labelWidget,
          defaultChecked: values.contains(i.value),
          disabled: widget.disabled,
          onChange: (checked) {
            if (checked) {
              values.add(i.value);
            } else {
              values.remove(i.value);
            }
            widget.onChange?.call(values);
          },
        );
      }).toList(),
    );
  }
}
