import 'package:flutter/material.dart';

/// 通用按钮
class CommonButton extends StatelessWidget {
  /// 按钮文本
  final String text;

  /// 按钮图标
  final IconData? icon;

  /// 背景颜色
  final Color? bgColor;

  /// 文本颜色
  final Color? color;

  /// 按钮边距
  final EdgeInsetsGeometry padding;

  /// 点击事件
  final void Function()? onTap;

  /// 双击事件
  final void Function()? onDoubleTap;

  /// 长按事件
  final void Function()? onLongPress;

  /// 显示边框
  final bool border;

  /// 边框宽度
  final double borderWidth;

  /// 边框颜色
  final Color? borderColor;

  /// 通用按钮
  const CommonButton({
    super.key, //
    required this.text,
    this.icon,
    this.color,
    this.bgColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.border = true,
    this.borderWidth = 1,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    /// 文本颜色
    var textColor = color ?? Theme.of(context).colorScheme.onSurface;

    /// 背景颜色
    var backgroundColor = bgColor ?? Theme.of(context).colorScheme.surfaceContainerLowest;

    /// 默认圆角
    var borderRadius = BorderRadius.circular(8);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor ?? Theme.of(context).colorScheme.outline.withAlpha(60),
          width: border ? borderWidth : 0, //
        ),
        borderRadius: borderRadius,
      ),
      child: Material(
        color: backgroundColor,
        borderRadius: borderRadius,
        child: InkWell(
          onTap: onTap,
          onDoubleTap: onDoubleTap,
          onLongPress: onLongPress,
          borderRadius: borderRadius,
          child: Padding(
            padding: padding,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                icon == null ? SizedBox.shrink() : Icon(icon, size: 18, color: textColor),
                text.isEmpty
                    ? SizedBox.shrink()
                    : Padding(
                      padding: EdgeInsets.only(left: icon == null ? 0 : 6),
                      child: Text(text, style: TextStyle(color: textColor, fontSize: 16)),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
