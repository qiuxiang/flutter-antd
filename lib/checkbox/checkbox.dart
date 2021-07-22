import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

export 'group.dart';

class AntdCheckbox extends StatefulWidget {
  final void Function(bool)? onChange;
  final bool defaultChecked;
  final String label;
  final Widget? labelWidget;
  final bool disabled;
  final bool? checked;
  final bool autoFocus;

  const AntdCheckbox({
    this.onChange,
    this.label = '',
    this.labelWidget,
    this.defaultChecked = false,
    this.disabled = false,
    this.autoFocus = false,
    this.checked,
  });

  @override
  _AntdCheckboxState createState() => _AntdCheckboxState();
}

class _AntdCheckboxState extends State<AntdCheckbox> {
  bool value = false;

  @override
  void initState() {
    super.initState();
    value = widget.checked ?? widget.defaultChecked;
  }

  @override
  void didUpdateWidget(AntdCheckbox old) {
    super.didUpdateWidget(old);
    if (widget.checked != null && widget.checked != old.checked) {
      setState(() => value = widget.checked!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final mouseCursor = widget.disabled ? SystemMouseCursors.forbidden : null;
    return InkWell(
      mouseCursor: mouseCursor,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: widget.disabled ? null : () => onChanged(!value),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        SizedBox(
          height: 20,
          width: 20,
          child: Checkbox(
            autofocus: widget.autoFocus,
            onChanged: widget.disabled ? null : onChanged,
            value: value,
            mouseCursor: mouseCursor,
            splashRadius: widget.disabled ? 0 : null,
          ),
        ),
        const SizedBox(width: 8),
        widget.labelWidget ?? Text(widget.label),
      ]),
    );
  }

  // ignore: avoid_positional_boolean_parameters
  void onChanged(bool? value) {
    if (widget.checked == null) {
      setState(() => this.value = value!);
    }
    widget.onChange?.call(value!);
  }
}
