import 'package:flutter/material.dart';

import '../themes/size.dart';

class WdgDialog extends StatefulWidget {
  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;
  final bool barrierDismissible;
  final Color? color;
  final CrossAxisAlignment? crossAxisAlignment;
  final double? height;
  final double? width;

  const WdgDialog({
    super.key,
    required this.title,
    required this.content,
    this.actions,
    this.barrierDismissible = true,
    this.color,
    this.crossAxisAlignment,
    this.height,
    this.width
  });

  @override
  State<WdgDialog> createState() => _WdgDialogState();
}

class _WdgDialogState extends State<WdgDialog> {
  bool show = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        setState(() {
          show = true;
        });
      }
    });

  }

  //=== Scale thu nhỏ trước khi pop ===
  Future<void> closeDialog() async {
    setState(() {
      show = false;
    });
    await Future.delayed(const Duration(milliseconds: 333));
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: PopScope(
                onPopInvokedWithResult: (a, c) async {
                  await closeDialog();
                },
                child: AnimatedScale(
                  scale: show ? 1 : 0.3,
                  duration: const Duration(milliseconds: 333),
                  curve: Curves.fastOutSlowIn,
                  child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: widget.height,
                        width: widget.width,
                        constraints: BoxConstraints(
                          minWidth: maxWidth / 2,
                          maxWidth: maxWidth ,
                          maxHeight: maxHeight
                        ),
                        decoration: BoxDecoration(
                          color: widget.color ?? Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: widget.crossAxisAlignment ?? CrossAxisAlignment.start,
                          children: [
                            widget.title ?? const SizedBox.shrink(),
                            widget.content ?? const SizedBox.shrink(),
                            if (widget.actions != null)
                              Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  alignment: WrapAlignment.center,
                                  children: widget.actions!
                              ),
                          ],
                        ),
                      )),
                )
            )
        )
    );
  }
}

