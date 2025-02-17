import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LeftSide extends ConsumerWidget {
  const LeftSide({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DragToMoveArea(
      //
      child: Container(
        width: 62,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerLowest,
          border: Border(
            // 边框
            right: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
          ),
        ),
        child: Column(
          // 啊啥的
          children: [
            // 头像
            Container(
              width: 40,
              height: 40,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.primaryContainer, borderRadius: BorderRadius.circular(4)),
              child: Icon(Icons.person, color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
            // 主题
            GestureDetector(
              child: Container(
                width: 40,
                height: 40,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
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
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(color: Theme.of(context).colorScheme.primaryContainer, borderRadius: BorderRadius.circular(10)),
                child: Icon(Icons.settings, color: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
              onTap: () {
                // TODO: 打开设置
              },
            ),
          ],
        ),
      ),
    );
  }
}
