import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_chat/widgets/left_side/left_side.dart';
import 'package:simple_chat/utils/store.dart';
import 'package:window_manager/window_manager.dart';

/// DefaultLayout 是应用程序的默认布局组件。
/// 它使用 AutoRouter 来处理路由导航，作为应用程序的主要布局容器。
@RoutePage()
class DefaultLayout extends ConsumerWidget {
  const DefaultLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 全局上下文绑定
    Store.context = context;
    Store.ref = ref;

    bool showBorder = true;
    if (kIsWeb) {
      // web 不显示边框
      showBorder = false;
    } else if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.fuchsia) {
      // 移动端不显示边框
      showBorder = false;
    }

    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.surface,
      backgroundColor: Colors.transparent,
      body: DragToResizeArea(
        child: Stack(
          children: [
            BorderContainer(
              showBorder: showBorder,
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

class BorderContainer extends StatelessWidget {
  final bool showBorder;
  final Widget child;
  const BorderContainer({super.key, required this.showBorder, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: showBorder ? EdgeInsets.all(4) : EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: showBorder ? [BoxShadow(color: Colors.black.withAlpha(150), blurRadius: 2, offset: Offset(0, 0))] : null,
        borderRadius: showBorder ? BorderRadius.circular(4) : BorderRadius.zero,
      ),
      child: child,
    );
  }
}
