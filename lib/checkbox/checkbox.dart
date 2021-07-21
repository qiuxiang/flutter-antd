import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AntdCheckbox extends StatefulWidget {
  final void Function(bool)? onChange;
  final bool defaultChecked;
  final String label;
  final Widget? labelWidget;

  const AntdCheckbox({
    this.onChange,
    this.label = '',
    this.labelWidget,
    this.defaultChecked = false,
  });

  @override
  _AntdCheckboxState createState() => _AntdCheckboxState();
}

class _AntdCheckboxState extends State<AntdCheckbox> {
  bool value = false;

  @override
  void initState() {
    super.initState();
    value = widget.defaultChecked;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () => onChanged(!value),
      child: Row(children: [
        Checkbox(onChanged: onChanged, value: value),
        widget.labelWidget ?? Text(widget.label),
      ]),
    );
  }

  // ignore: avoid_positional_boolean_parameters
  void onChanged(bool? value) {
    setState(() => this.value = value!);
    widget.onChange?.call(value!);
  }
}
