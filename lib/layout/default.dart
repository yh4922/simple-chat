import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:simple_chat/widgets/left_side/left_side.dart';
import 'package:window_manager/window_manager.dart';

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
      // backgroundColor: Theme.of(context).colorScheme.surface,
      backgroundColor: Colors.transparent,
      body: DragToResizeArea(
        child: Stack(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                boxShadow: [BoxShadow(color: Colors.black.withAlpha(150), blurRadius: 2, offset: Offset(0, 0))],
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: [
                  LeftSide(),
                  Expanded(
                    child: Container(
                      // 内容 brightness
                      // color: Theme.of(context).colorScheme.surface,
                      child: AutoRouter(),
                    ),
                  ),
                ],
              ),
            ),
            // 堆叠层 后续可以放一些其他组件 弹窗等
            // Positioned(child: Container(child: Text('123'))),
          ],
        ),
      ),
    );
  }
}
