import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AntdSwitch extends StatefulWidget {
  final bool? checked;
  final bool defaultChecked;
  final Widget? checkedChildren;
  final Widget? unCheckedChildren;
  final void Function(bool)? onChange;

  const AntdSwitch({
    this.checked,
    this.defaultChecked = false,
    this.onChange,
    this.checkedChildren,
    this.unCheckedChildren,
    Key? key,
  }) : super(key: key);

  @override
  _AntdSwitchState createState() => _AntdSwitchState();
}

class _AntdSwitchState extends State<AntdSwitch> with TickerProviderStateMixin {
  static const padding = 2.0;
  static const size = 18.0;
  late final AnimationController controller;
  late final CurvedAnimation animation;
  late final Animation<Color?> color;
  final checkedWidget = GlobalKey();
  final unCheckedWidget = GlobalKey();
  double checkedWidth = 0;
  double unCheckedWidth = 0;
  bool checked = false;

  @override
  void initState() {
    super.initState();
    checked = widget.checked ?? widget.defaultChecked;
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.easeOut);
    color = ColorTween(
      begin: const Color(0x40000000),
      end: const Color(0xff1890ff),
    ).animate(controller);
    if (checked) {
      controller.forward(from: 1);
    }
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      setState(() {
        checkedWidth = getWidth(checkedWidget);
        unCheckedWidth = getWidth(unCheckedWidget);
      });
    });
  }

  @override
  void didUpdateWidget(AntdSwitch old) {
    super.didUpdateWidget(old);
    if (widget.checked != null && widget.checked != old.checked) {
      changeState();
    }
  }

  double getWidth(GlobalKey key) {
    final render = key.currentContext?.findRenderObject();
    if (render == null) return size;
    return (render as RenderBox).size.width + size / 2 + padding;
  }

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    final width = checkedWidth + size;
    final children = <Widget>[];
    if (widget.checkedChildren != null) {
      final child = widget.checkedChildren!;
      children.add(buildAnimatedLabel(child, checked ? 1 : 0, checkedWidget));
    }
    if (widget.unCheckedChildren != null) {
      final child = widget.unCheckedChildren!;
      children.add(buildAnimatedLabel(child, checked ? 0 : 1));
    }
    children.add(AnimatedBuilder(
      animation: controller,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(size),
          boxShadow: const [
            BoxShadow(
              color: Color(0x3300230b),
              offset: Offset(0, 2),
              blurRadius: 4,
            ),
          ],
        ),
      ),
      builder: (context, child) {
        final left = (width - size) * animation.value;
        return Positioned(left: left, child: child!);
      },
    ));
    return Row(mainAxisSize: MainAxisSize.min, children: [
      GestureDetector(
        onTap: toggle,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Container(
                width: width + padding * 2,
                height: size + padding * 2,
                padding: const EdgeInsets.all(padding),
                decoration: BoxDecoration(
                  color: color.value,
                  borderRadius: BorderRadius.circular(size),
                ),
                child: child,
              );
            },
            child: Stack(children: children),
          ),
        ),
      ),
    ]);
  }

  Widget buildLabel(_, Widget? child) {
    final left = size / 2 - padding + (size - padding) * (1 - animation.value);
    return Positioned(left: left, child: child!);
  }

  Widget buildAnimatedLabel(Widget child, double opacity, [Key? key]) {
    const textStyle = TextStyle(fontSize: 12, color: Colors.white);
    return AnimatedBuilder(
      animation: controller,
      builder: buildLabel,
      child: Container(
        height: size,
        alignment: Alignment.center,
        child: AnimatedOpacity(
          opacity: opacity,
          duration: controller.duration!,
          child: IconTheme(
            data: const IconThemeData(size: 16, color: Colors.white),
            child: DefaultTextStyle(key: key, style: textStyle, child: child),
          ),
        ),
      ),
    );
  }

  void toggle() {
    widget.onChange?.call(!checked);
    if (widget.checked == null) {
      changeState();
    }
  }

  void changeState() {
    setState(() => checked = !checked);
    if (checked) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }
}
