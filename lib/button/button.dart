import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final void Function()? onClick;
  final Widget? child;
  final String text;
  final ButtonType? type;
  final ButtonShape? shape;
  final bool loading;
  final bool disabled;
  final bool danger;
  final IconData? icon;
  final ButtonSize size;

  const Button({
    this.onClick,
    this.child,
    this.text = '',
    this.type,
    this.shape,
    this.loading = false,
    this.disabled = false,
    this.danger = false,
    this.size = ButtonSize.middle,
    this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconOnly = child == null && text.isEmpty;
    Color? color;
    Color? focusColor;
    Color? textColor;
    BorderSide? side;
    OutlinedBorder? shape;
    const height = 32.0;
    if (this.shape != null) {
      shape = const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(height)),
      );
    }
    switch (type) {
      case ButtonType.primary:
        color = theme.primaryColor;
        textColor = Colors.white;
        break;
      case ButtonType.text:
        color = Colors.transparent;
        focusColor = theme.focusColor;
        textColor = theme.textTheme.bodyText2?.color;
        break;
      case ButtonType.link:
        color = Colors.transparent;
        focusColor = theme.accentColor;
        textColor = theme.accentColor;
        break;
      default:
        color = theme.cardColor;
        focusColor = theme.primaryColor;
        textColor = theme.textTheme.bodyText2?.color;
        side = BorderSide(color: theme.dividerColor);
    }
    if (disabled) {
      color = theme.disabledColor;
      textColor = theme.textTheme.caption?.color;
      side = BorderSide(color: theme.dividerColor);
      if (type == ButtonType.text || type == ButtonType.link) {
        color = Colors.white.withOpacity(0);
        side = BorderSide.none;
      }
    }
    if (danger) {
      switch (type) {
        case ButtonType.primary:
          color = theme.errorColor;
          break;
        case ButtonType.text:
          textColor = theme.errorColor;
          break;
        case ButtonType.link:
          textColor = theme.errorColor;
          focusColor = theme.errorColor;
          break;
        default:
          textColor = theme.errorColor;
          focusColor = theme.errorColor;
          side = side?.copyWith(color: theme.errorColor);
      }
    }

    final children = <Widget>[];
    if (loading) {
      final loadingWidget = Padding(
        padding: const EdgeInsets.all(2),
        child: SizedBox(
          width: 12,
          height: 12,
          child: CircularProgressIndicator(strokeWidth: 1.2, color: textColor),
        ),
      );
      children.add(loadingWidget);
    } else if (icon != null) {
      children.add(Icon(icon, size: 16, color: textColor));
    }
    if (!iconOnly) {
      if (icon != null || loading) {
        children.add(const SizedBox(width: 6));
      }
      children.add(child ?? Text(text));
    }
    return SizedBox(
      width: iconOnly || this.shape == ButtonShape.circle ? height : null,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: color,
          onPrimary: focusColor,
          onSurface: color,
          shadowColor: Colors.transparent,
          side: side,
          shape: shape,
        ),
        onPressed: loading || disabled ? null : onClick ?? () {},
        child: DefaultTextStyle(
          style: TextStyle(color: textColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        ),
      ),
    );
  }
}

enum ButtonType { primary, text, link }
enum ButtonSize { large, middle, small }
enum ButtonShape { circle, round }
