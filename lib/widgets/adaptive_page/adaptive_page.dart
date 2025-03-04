import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_chat/states/routes/routes.dart';
import 'package:simple_chat/states/window/size.dart';

class AdaptivePage extends ConsumerWidget {
  /// 路由标识名称
  final String name;

  /// 侧边栏宽度  在PC多页面下生效
  final double sidebarWidth;

  /// 侧边栏组件
  final Widget sidebar;

  /// 二级页面组件
  final Widget body;

  const AdaptivePage({
    // 参数
    super.key,
    required this.name,
    required this.sidebarWidth,
    required this.sidebar,
    required this.body,
  });

  /// 显示侧边栏
  /// path == name 时 显示
  /// path != name 时判断是否单页  单页不显示
  bool showSidebar(Size size, String path) {
    return path == name || !WinSizeData.isOnePage(size);
  }

  /// 显示详情
  bool showBody(Size size, String path) {
    return path != name || !WinSizeData.isOnePage(size);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = WinSizeData.value(ref);
    String path = RoutesData.value(ref);

    return SizedBox.expand(
      child: Stack(
        children: [
          // 占位
          Positioned.fill(child: SizedBox.expand()),
          Container(
            // color: Theme.of(context).colorScheme.surfaceContainerLowest,
            child: Padding(
              padding: EdgeInsets.only(
                left: WinSizeData.isOnePage(size) ? 0 : 250,
              ),
              child: body,
            ),
          ),
          showSidebar(size, path)
              ? SizedBox(
                width: WinSizeData.isOnePage(size) ? double.infinity : 250,
                child: Container(
                  // color: Theme.of(context).colorScheme.surfaceContainerLowest,
                  child: sidebar,
                ),
              )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
