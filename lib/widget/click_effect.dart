import 'package:flutter/material.dart';

class ClickEffect extends StatefulWidget {
  ClickEffect(
      {Key key,
      this.margin,
      this.padding,
      this.normalColor: Colors.white,
      this.selectColor: const Color(0xffcccccc),
      this.onTap,
      this.child})
      : super(key: key);

  final EdgeInsetsGeometry margin;

  final EdgeInsetsGeometry padding;

  final Color normalColor;

  final Color selectColor;

  final GestureTapCallback onTap;

  final Widget child;

  @override
  _ClickEffectState createState() => _ClickEffectState();
}

class _ClickEffectState extends State<ClickEffect> {
  Color color;

  @override
  void initState() {
    super.initState();
    if (widget.normalColor == null) {
      color = Colors.white;
    } else {
      color = widget.normalColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: widget.margin,
        padding: widget.padding,
        child: widget.child,
        color: color,
      ),
      onTap: widget.onTap,
      onTapDown: (_) {
        setState(() {
          color = widget.selectColor;
        });
      },
      onTapUp: (_) {
        setState(() {
          color = widget.normalColor;
        });
      },
      onTapCancel: () {
        setState(() {
          color = widget.normalColor;
        });
      },
    );
  }
}
