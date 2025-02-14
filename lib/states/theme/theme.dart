import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_chat/theme/index_theme.dart';

part 'theme.g.dart';

@riverpod
class ThemeStore extends _$ThemeStore {
  @override
  ThemeData build() {
    /// TODO: 后续可能需要从本地缓存获取历史值
    return themeBlueGrey;
  }

  /// 更新状态
  void update(ThemeData newTheme) {
    state = newTheme;
  }

  /// 获取值
  static ThemeData value(WidgetRef ref) {
    return ref.watch(themeStoreProvider);
  }

  /// 设置值
  static void change(WidgetRef ref, ThemeData newTheme) {
    ref.read(themeStoreProvider.notifier).update(newTheme);
  }
}
