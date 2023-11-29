import 'package:flutter/material.dart';

class CommonCard extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final bool hasBorder;
  final Color? color;
  final Function()? onTap;
  final double? width;
  final double? height;
  const CommonCard({
    super.key,
    required this.children,
    this.padding,
    this.margin,
    this.hasBorder = true,
    this.onTap,
    this.color,
    this.width,
    this.height,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: color,
        margin: margin ??
            EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
            ),
        elevation: 0,
        shape: hasBorder
            ? RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.grey.withOpacity(.25),
                ),
                borderRadius: BorderRadius.circular(16),
              )
            : null,
        child: Container(
          padding: padding ?? EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          width: width ?? double.infinity,
          height: height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );
  }
}
