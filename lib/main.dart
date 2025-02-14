import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'router/router.dart';

void main() {
  runApp(
    // 使用ProviderScope包裹MyApp
    ProviderScope(
      child: MyApp(), // 使用MyApp作为子组件
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // 导入路由
  final rootRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // 使用路由
      routerConfig: rootRouter.config(),
    );
  }
}
