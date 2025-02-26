import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_chat/states/window/max.dart';
import 'package:simple_chat/widgets/left_side/left_side.dart';
import 'package:simple_chat/utils/store.dart';
import 'package:simple_chat/widgets/window_buttons/window_buttons.dart';
import 'package:window_manager/window_manager.dart';

/// DefaultLayout 是应用程序的默认布局组件。
/// 它使用 AutoRouter 来处理路由导航，作为应用程序的主要布局容器。
@RoutePage()
class DefaultLayout extends ConsumerStatefulWidget {
  const DefaultLayout({super.key});
  @override
  ConsumerState<DefaultLayout> createState() => _DefaultLayoutState();
}

class _DefaultLayoutState extends ConsumerState<DefaultLayout> with WindowListener {
  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
  }

  @override
  void onWindowUnmaximize() {
    if (mounted) {
      WinMaxStatus.change(ref, false);
    }
  }

  @override
  void onWindowMaximize() {
    if (mounted) {
      WinMaxStatus.change(ref, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("123123123123123");
    // // 全局上下文绑定
    // Store.context = context;
    // Store.ref = ref;

    final winMaxStatus = WinMaxStatus.value(ref);

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

    var content = BorderContainer(
      showBorder: showBorder && !winMaxStatus,
      child: Row(
        children: [
          LeftSide(),
          Expanded(
            child: SizedBox(
              child: Stack(
                children: [
                  // 内容区域
                  Column(children: [Expanded(child: AutoRouter())]),
                  // 标题栏盖住内容
                  Store.isWin || Store.isLinux ? WindowButtons() : SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.surface,
      backgroundColor: Colors.transparent,
      body: Material(type: MaterialType.transparency, child: winMaxStatus ? content : DragToResizeArea(child: content)),
    );
  }
}

class BorderContainer extends StatelessWidget {
  final bool showBorder;
  final Widget child;
  const BorderContainer({super.key, required this.showBorder, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: Container(
            clipBehavior: Clip.antiAlias,
            margin: showBorder ? EdgeInsets.all(4) : EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              boxShadow: showBorder ? [BoxShadow(color: Colors.black.withAlpha(150), blurRadius: 2, offset: Offset(0, 0))] : null,
              borderRadius: showBorder ? BorderRadius.circular(4) : BorderRadius.zero,
            ),
            child: child,
          ),
        ),
      ],
    );
  }
}
