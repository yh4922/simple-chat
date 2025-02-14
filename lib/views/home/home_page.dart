import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // 主轴居中对齐
      body: Center(child: Text('Home Page')),
    );
  }
}
