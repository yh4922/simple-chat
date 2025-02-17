import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_chat/utils/store.dart';

part 'locale.g.dart';

@riverpod
class LocaleData extends _$LocaleData {
  @override
  Locale build() {
    return Store.locale;
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
  static void change(WidgetRef ref, String localeName) {
    // 保存到缓存 并设置语言
    Store.localeName = localeName;
    Store.prefs.setString("localeName", localeName);
    Locale newLocale = Locale(localeName);
    ref.read(localeDataProvider.notifier).update(newLocale);
  }
}
