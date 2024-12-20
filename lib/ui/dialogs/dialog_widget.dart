import 'package:flutter/material.dart';
import 'package:lap_english/ui/colors/vip_colors.dart';

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
  final bool? shadow;
  final bool? border;

  const WdgDialog({
    super.key,
    required this.title,
    required this.content,
    this.actions,
    this.barrierDismissible = true,
    this.color,
    this.crossAxisAlignment,
    this.height,
    this.width,
    this.shadow,
    this.border
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
    hasChanged.addListener(updateScreen);
  }

  void updateScreen() {
    if(context.mounted) {
      setState(() {});
    }
  }

  //=== Scale thu nhỏ trước khi pop ===
  Future<void> closeDialog() async {
    hasChanged.removeListener(updateScreen);
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
          if(widget.barrierDismissible) {
            Navigator.of(context).pop();
          }
        },
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: PopScope(
                canPop: widget.barrierDismissible,
                onPopInvokedWithResult: (a, c) async {
                  if(widget.barrierDismissible) {
                    await closeDialog();
                  }
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
                          border: (widget.border != null && widget.border!)
                              ? Border.all(color: VipColors.onPrimary(context), width: 1.6)
                              : null,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: (widget.shadow != null && widget.shadow!)
                              ?
                                [
                                  BoxShadow(
                                    color: VipColors.onPrimary(context),
                                    offset: const Offset(0.66, 0.66),
                                    blurRadius: 6,
                                    spreadRadius: 0.6,
                                  ),

                                  BoxShadow(
                                    color: VipColors.onPrimary(context),
                                    offset: const Offset(-0.66, -0.66),
                                    blurRadius: 6,
                                    spreadRadius: 0.6,
                                  ),
                                ]
                              : null
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

