import 'package:flutter_riverpod/src/consumer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_chat/utils/store.dart';

part 'max.g.dart';

@riverpod
class WinMaxStatus extends _$WinMaxStatus {
  @override
  bool build() {
    if (Store.isDesktop) {
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
}
