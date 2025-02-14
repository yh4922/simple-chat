import 'package:flutter_riverpod/src/consumer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'example.g.dart';

@riverpod
class ExampleDataRef extends _$ExampleDataRef {
  @override
  String build() {
    return 'Hello world';
  }

  /// 更新状态
  void update(String newData) {
    state = newData;
  }

  /// 获取值
  static String value(WidgetRef ref) {
    return ref.watch(exampleDataRefProvider);
  }

  /// 设置值
  static void setValue(WidgetRef ref, String newData) {
    ref.read(exampleDataRefProvider.notifier).update(newData);
  }
}
