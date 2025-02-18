import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LeftSide extends ConsumerWidget {
  const LeftSide({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var liftSide = Container(
      width: 62,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLowest,
        border: Border(
          //
          right: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
        ),
      ),
      child: Column(
        // 啊啥的
        children: [
          SizedBox(height: 20),
          // 头像
          Material(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(6),
            child: InkWell(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  // 圆角
                  borderRadius: BorderRadius.circular(6),
                  // 背景图片
                  image: DecorationImage(image: AssetImage('assets/images/logo.png'), fit: BoxFit.cover),
                ),
              ),
              onTap: () {
                print('点击头像');
              },
            ),
          ),
          SizedBox(height: 20),
          // 主题
          GestureDetector(
            child: Container(
              width: 40,
              height: 40,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                // color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.brightness_4, color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
            onTap: () {
              // TODO: 打开主题设置
            },
          ),
          // 设置
          GestureDetector(
            child: Container(
              width: 40,
              height: 40,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.primaryContainer, borderRadius: BorderRadius.circular(10)),
              child: Icon(Icons.settings, color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
            onTap: () {
              // TODO: 打开设置
            },
          ),
        ],
      ),
    );
    if (kIsWeb) {
      return liftSide;
    }
    return DragToMoveArea(child: liftSide);
  }
}
