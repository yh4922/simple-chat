import 'package:flutter_riverpod/src/consumer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_chat/utils/store.dart';
import 'package:window_manager/window_manager.dart';

part 'max.g.dart';

class WinMaxStatusListener with WindowListener {
  WinMaxStatusListener() {
    windowManager.addListener(this);
  }

  @override
  void onWindowUnmaximize() {
    WinMaxStatus.change(Store.ref, false);
  }

  @override
  void onWindowMaximize() {
    WinMaxStatus.change(Store.ref, true);
  }
}

@riverpod
class WinMaxStatus extends _$WinMaxStatus with WindowListener {
  @override
  bool build() {
    if (Store.isDesktop) {
      WinMaxStatusListener();
      return false;
    } else {
      return true;
    }
  }

  /// 更新状态
  void update(bool status) {
    state = status;
  }

  /// 获取值
  static bool value(WidgetRef ref) {
    return ref.watch(winMaxStatusProvider);
  }

  /// 设置值
  static void change(WidgetRef ref, bool status) {
    ref.read(winMaxStatusProvider.notifier).update(status);
  }

  @override
  void onWindowUnmaximize() {
    // do something
    print("取消最大化");
  }

  @override
  void onWindowMaximize() {
    // do something
    print("最大化");
  }
}
