import 'package:flutter/material.dart';

class WdgButton extends StatefulWidget {
  final Function onTap;
  final Color? color;
  final BorderRadius? borderRadius;
  final ButtonFit? buttonFit;
  final Widget child;

  const WdgButton({
    super.key,
    required this.onTap,
    this.color,
    this.borderRadius,
    required this.child,
    this.buttonFit,
  });

  @override
  State createState() => _WdgButtonState();
}

class _WdgButtonState extends State<WdgButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      onTap: () {
        setState(() => _isPressed = true);
        widget.onTap();
        Future.delayed(const Duration(milliseconds: 10), () {
          setState(() => _isPressed = false);
        });
      },
      child: Container(
        margin: _isPressed ? const EdgeInsets.only(top: 5) : const EdgeInsets.only(top: 0),
        decoration: BoxDecoration(
          color: widget.color != Colors.transparent
              ? Color.alphaBlend(Colors.white30, widget.color ?? Theme.of(context).primaryColor)
              : Colors.transparent,
          borderRadius: widget.borderRadius,
          border: Border(
            bottom: BorderSide(
              width: _isPressed ? 0.1 : 4,
              color: widget.color != Colors.transparent
                  ? Color.alphaBlend(
                Colors.grey.withAlpha(50),
                widget.color ?? Colors.transparent,
              )
                  : Colors.transparent,
            ),
            right: BorderSide(
              width: _isPressed ? 0.1 : 1,
              color: widget.color != Colors.transparent
                  ? Color.alphaBlend(
                Colors.grey.withAlpha(50),
                widget.color ?? Colors.transparent,
              )
                  : Colors.transparent,
            ),
          ),
        ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: switch (widget.buttonFit) {
            null => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [widget.child]),
            ButtonFit.none => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [widget.child]),
            ButtonFit.scaleDown => FittedBox(
                fit: BoxFit.none,
                alignment: Alignment.center,
                child: widget.child,
              ),
          }),
    );
  }
}

enum ButtonFit {
  none, scaleDown
}