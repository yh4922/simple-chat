import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale.g.dart';

@riverpod
class LocaleData extends _$LocaleData {
  @override
  Locale build() {
    return Locale('en');
  }

  /// 更新状态
  void update(Locale newLocale) {
    state = newLocale;
  }

  /// 获取值
  static Locale value(WidgetRef ref) {
    return ref.watch(localeDataProvider);
  }

  /// 设置值
  static void change(WidgetRef ref, Locale newLocale) {
    ref.read(localeDataProvider.notifier).update(newLocale);
  }
}
