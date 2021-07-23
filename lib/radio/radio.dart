import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

export 'group.dart';

class AntdRadio<T> extends StatefulWidget {
  final bool defaultChecked;
  final String label;
  final Widget? labelWidget;
  final bool disabled;
  final bool? checked;
  final bool autoFocus;
  final T? value;
  final void Function(T?)? onChanged;

  const AntdRadio({
    this.label = '',
    this.labelWidget,
    this.defaultChecked = false,
    this.disabled = false,
    this.autoFocus = false,
    this.checked,
    this.value,
    this.onChanged,
  });

  @override
  _AntdRadioState<T> createState() => _AntdRadioState<T>();
}

class _AntdRadioState<T> extends State<AntdRadio<T>> {
  bool checked = false;

  @override
  void initState() {
    super.initState();
    checked = widget.checked ?? widget.defaultChecked;
  }

  @override
  void didUpdateWidget(AntdRadio<T> old) {
    super.didUpdateWidget(old);
    if (widget.checked != null && widget.checked != old.checked) {
      setState(() => checked = widget.checked!);
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
      onTap: widget.disabled ? null : onTap,
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        SizedBox(
          height: 20,
          width: 20,
          child: Radio(
            autofocus: widget.autoFocus,
            onChanged: widget.disabled ? null : (_) => onTap(),
            value: checked,
            groupValue: true,
            mouseCursor: mouseCursor,
            splashRadius: widget.disabled ? 0 : null,
          ),
        ),
        const SizedBox(width: 8),
        widget.labelWidget ?? Text(widget.label),
      ]),
    );
  }

  void onTap() {
    if (!checked) {
      setState(() => checked = true);
      widget.onChanged?.call(widget.value);
    }
  }
}
