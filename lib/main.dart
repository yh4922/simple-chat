import 'package:flutter/material.dart';
import 'router/router.dart';

void main() {
  runApp(MyApp());
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
