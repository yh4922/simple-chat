import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:simple_chat/widgets/left_side.dart';

/// DefaultLayout 是应用程序的默认布局组件。
/// 它使用 AutoRouter 来处理路由导航，作为应用程序的主要布局容器。
@RoutePage()
class DefaultLayout extends StatefulWidget {
  const DefaultLayout({super.key});

  @override
  State<DefaultLayout> createState() => _DefaultLayoutState();
}

class _DefaultLayoutState extends State<DefaultLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceBright,
      body: Row(
        children: [
          LeftSide(),
          Expanded(
            // 内容 brightness
            child: AutoRouter(),
          ),
        ],
      ),
    );
  }
}
