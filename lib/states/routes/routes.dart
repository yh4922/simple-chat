import 'package:flutter_riverpod/src/consumer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'routes.g.dart';

@riverpod
class RoutesData extends _$RoutesData {
  @override
  String build() {
    return "Chat";
  }

  /// 更新状态
  void update(String newRoute) {
    state = newRoute;
  }

  /// 获取值
  static String value(WidgetRef ref) {
    return ref.watch(routesDataProvider);
  }

  /// 设置值
  static void change(WidgetRef ref, String newRoute) {
    ref.read(routesDataProvider.notifier).update(newRoute);
  }
}
