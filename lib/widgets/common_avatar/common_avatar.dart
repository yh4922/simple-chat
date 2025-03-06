import 'dart:io';
import 'package:flutter/material.dart';

class CommonAvatar extends StatelessWidget {
  /// 半径
  final double radius;

  /// 头像
  final String avatar;

  /// 背景颜色
  final Color? backgroundColor;

  final void Function(BuildContext context)? onContext;
  const CommonAvatar({
    super.key, //
    required this.avatar,
    this.radius = 20,
    this.backgroundColor,
    this.onContext,
  });

  @override
  Widget build(BuildContext context) {
    // 执行函数 把context传递到外部方便弹窗窗口定位
    onContext?.call(context);

    /// 文本头像
    Widget? textAvatar;

    /// 图片头像
    ImageProvider<Object>? foregroundImage;

    /// 小于10则为文字头像
    if (avatar.length < 10) {
      // 判断是否为emoji表情,如果是则不截取,否则截取第一个字符
      // final isEmoji = RegExp(r'[\u{1F300}-\u{1F9FF}]', unicode: true).hasMatch(avatar);
      // final displayText = isEmoji ? avatar : avatar[0];
      textAvatar = Text(
        avatar,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimaryContainer, //
          fontWeight: FontWeight.w600,
          fontSize: radius,
        ),
      );
    } else if (avatar.startsWith("http:")) {
      foregroundImage = NetworkImage(avatar);
    } else {
      foregroundImage = FileImage(File(avatar));
    }

    return CircleAvatar(
      foregroundImage: foregroundImage,
      radius: radius,
      // 背景颜色默认是主色容器
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.primaryContainer,
      child: textAvatar,
    );
  }
}
