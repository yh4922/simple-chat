import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_chat/states/example/example.dart';

/// 继承 ConsumerWidget
@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// 通过ExampleDataRef.value获取值
    final String exampleData = ExampleDataRef.value(ref);

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            // 使用exampleData
            Text(exampleData),
            ElevatedButton(
              child: Text('点击修改'),
              onPressed: () {
                ExampleDataRef.setValue(ref, "Hello Riverpod");
              },
            ),
          ],
        ),
      ),
    );
  }
}
