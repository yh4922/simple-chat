import 'package:flutter_riverpod/src/consumer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_chat/theme/index_theme.dart';
import 'package:simple_chat/utils/store.dart';

part 'theme.g.dart';

@riverpod
class ThemeStore extends _$ThemeStore {
  @override
  ThemeDatas build() {
    return Store.theme;
  }

  /// 更新状态
  void update(ThemeDatas newTheme) {
    state = newTheme;
  }

  /// 获取值
  static ThemeDatas value(WidgetRef ref) {
    return ref.watch(themeStoreProvider);
  }

  /// 设置值
  static void change(WidgetRef ref, String themeName) {
    Store.themeName = themeName;
    Store.prefs.setString("themeName", themeName);
    ThemeDatas newTheme = ThemeDatas.findByName(themeName);
    ref.read(themeStoreProvider.notifier).update(newTheme);
  }
}
