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
    Locale newLocale = getLocale(localeName);
    ref.read(localeDataProvider.notifier).update(newLocale);
  }

  /// 支持的语言
  static Iterable<Locale> supportedLocales = [
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'), // 简体中文
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'), // 繁体中文
    Locale('en'), // English
    Locale('ja'), // 日本
    Locale('ko'), // 韩国
  ];

  /// 获取语言
  static Locale getLocale(String? localeName) {
    switch (localeName) {
      case 'zh_Hans':
        return Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans');
      case 'zh_Hant':
        return Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant');
      case 'zh':
        return Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans');
      case 'en':
        return Locale('en');
      case 'ja':
        return Locale('ja');
      case 'ko':
        return Locale('ko');
      default:
        return Locale(localeName ?? 'en');
    }
  }
}
