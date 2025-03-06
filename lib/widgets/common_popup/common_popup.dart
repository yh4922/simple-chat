import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_chat/states/window/max.dart';
import 'package:simple_chat/utils/store.dart';
import 'package:window_manager/window_manager.dart';

/// 添加助手弹出
class CommonPopup extends ConsumerWidget {
  /// 子部件
  final Widget child;

  /// 关闭弹窗动画
  final void Function() cancel;

  /// 动画控制器
  final AnimationController? controller;

  final Color? backgroundColor;
  const CommonPopup({
    super.key,
    required this.child,
    required this.cancel, //
    this.controller,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final winMaxStatus = WinMaxStatus.value(ref);
    bool showBorder = true;

    if (kIsWeb) {
      showBorder = false;
    } else if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.fuchsia) {
      // 移动端不显示边框
      showBorder = false;
    }

    //  动画控制器
    var _controller = controller;
    if (controller == null) {
      _controller = AnimationController(vsync: Navigator.of(context), value: 1.0);
    }

    var mask = FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(_controller!),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).colorScheme.shadow.withAlpha(100),
          borderRadius: BorderRadius.circular(showBorder && !winMaxStatus ? 10 : 0),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: showBorder && !winMaxStatus ? EdgeInsets.all(4) : EdgeInsets.zero,
        child: Stack(
          children: [
            Positioned.fill(child: GestureDetector(onTap: cancel, child: mask)),
            SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0, -0.1),
                end: Offset.zero,
              ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut)),
              child: child,
            ),
            // child,
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Store.isDesktop ? DragToMoveArea(child: SizedBox(height: 40, width: double.infinity)) : SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
