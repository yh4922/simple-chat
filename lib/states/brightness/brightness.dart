import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_chat/utils/store.dart';

part 'brightness.g.dart';

@riverpod
class BrightnessStore extends _$BrightnessStore {
  @override
  ThemeMode build() {
    return Store.brightness;
  }

  /// 更新状态
  void update(ThemeMode newMode) {
    state = newMode;
  }

  /// 获取值
  static ThemeMode value(WidgetRef ref) {
    return ref.watch(brightnessStoreProvider);
  }

  /// 设置值
  static void change(WidgetRef ref, String name) {
    Store.brightnessName = name;
    Store.prefs.setString("brightnessName", name);
    ThemeMode newMode = ThemeMode.light;
    if (name == "light") {
      newMode = ThemeMode.light;
    } else if (name == "dark") {
      newMode = ThemeMode.dark;
    } else {
      newMode = ThemeMode.system;
    }
    ref.read(brightnessStoreProvider.notifier).update(newMode);
  }

  /// 切换
  static void toggle(WidgetRef ref) {
    ThemeMode current = ref.read(brightnessStoreProvider);
    if (current == ThemeMode.light) {
      change(ref, "dark");
    } else if (current == ThemeMode.dark) {
      change(ref, "light");
    }
  }
}
