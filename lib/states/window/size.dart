import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_chat/utils/store.dart';

part 'size.g.dart';

@riverpod
class WinSizeData extends _$WinSizeData {
  @override
  Size build() {
    return Store.winSize;
  }

  /// 更新状态
  void update(Size size) {
    state = size;
  }

  /// 获取值
  static Size value(WidgetRef ref) {
    return ref.watch(winSizeDataProvider);
  }

  /// 设置值
  static void change(WidgetRef ref, Size size) {
    Store.winSize = size;
    ref.read(winSizeDataProvider.notifier).update(size);
  }

  /// 是否单页展示
  /// 路由分为一级路由和二级路由
  /// 单页模式下一屏之展示一级  多页模式一级二级同屏展示
  static bool isOnePage(Size size) {
    // PC 按照size.width < 700判断
    if (Store.isDesktop) {
      return size.width < 700;
    }

    // 移动端 判断横屏和竖屏
    var orientation = MediaQueryData.fromView(WidgetsBinding.instance.window).orientation;
    return orientation == Orientation.portrait;
  }
}
