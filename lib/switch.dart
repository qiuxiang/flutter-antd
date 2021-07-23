import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AntdSwitch extends StatefulWidget {
  final bool? checked;
  final bool defaultChecked;
  final double width;
  final void Function(bool)? onChange;

  const AntdSwitch({
    this.checked,
    this.defaultChecked = false,
    this.onChange,
    this.width = 44,
    Key? key,
  }) : super(key: key);

  @override
  _AntdSwitchState createState() => _AntdSwitchState();
}

class _AntdSwitchState extends State<AntdSwitch> with TickerProviderStateMixin {
  bool checked = false;
  late final AnimationController controller;
  late final CurvedAnimation animation;
  late final Animation<Color?> color;

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
  }

  @override
  void didUpdateWidget(AntdSwitch old) {
    super.didUpdateWidget(old);
    if (widget.checked != null && widget.checked != old.checked) {
      changeState();
    }
  }

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    const height = 22.0;
    const size = height - 4;
    return GestureDetector(
      onTap: toggle,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Container(
              width: widget.width,
              height: height,
              decoration: BoxDecoration(
                color: color.value,
                borderRadius: BorderRadius.circular(22),
              ),
              child: child,
            );
          },
          child: Stack(children: [
            AnimatedBuilder(
              animation: controller,
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(height - 4),
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
                final left = (widget.width - size - 4) * animation.value + 2;
                return Positioned(top: 2, left: left, child: child!);
              },
            ),
            // const Positioned(
            //   top: 2,
            //   left: height + 2,
            //   child: Text(
            //     '关闭',
            //     style: TextStyle(fontSize: 12, color: Colors.white),
            //   ),
            // ),
          ]),
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
    checked = !checked;
    if (checked) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }
}
