import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:simple_chat/router/router.dart';
import 'package:simple_chat/states/brightness/brightness.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_chat/widgets/iconfont/iconfont.dart';
import 'package:auto_route/auto_route.dart';
import 'package:simple_chat/states/routes/routes.dart';
import 'package:simple_chat/i18n/generated/l10n.dart';
import 'package:el_tooltip/el_tooltip.dart';

class NavItem extends StatelessWidget {
  /// 图标
  final IconData icon;

  /// 标题
  final String title;

  /// 是否激活
  final bool isActive;

  /// 点击事件
  final VoidCallback onTap;
  final double top;
  const NavItem({
    //
    super.key,
    required this.icon,
    required this.title,
    required this.isActive,
    required this.onTap,
    this.top = 14,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanStart: (_) {},
        onDoubleTap: () {},
        child: ElTooltip(
          content: Text("123123"),
          position: ElTooltipPosition.rightCenter,
          color: Theme.of(context).colorScheme.surfaceContainerLowest,
          child: Material(
            color: isActive ? Theme.of(context).colorScheme.primaryContainer.withAlpha(100) : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(6),
              child: SizedBox(width: 34, height: 34, child: Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary)),
            ),
          ),
        ),
      ),
    );
  }
}

class LeftSide extends ConsumerWidget {
  const LeftSide({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 使用 AutoRouter 获取当前路由
    final currentRoute = RoutesData.value(ref);
    final loc = S.of(context);
    final brightness = BrightnessStore.value(ref);

    var liftSide = Container(
      width: 62,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLowest.withAlpha(150),
        border: Border(right: BorderSide(color: Theme.of(context).colorScheme.outlineVariant)),
      ),
      child: Column(
        // 啊啥的
        children: [
          // 安全区域
          SizedBox(height: MediaQuery.of(context).padding.top + 20),
          // 头像
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onPanStart: (_) {},
            onDoubleTap: () {},
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                // 圆角
                borderRadius: BorderRadius.circular(6),
                // 背景图片
                image: DecorationImage(image: AssetImage('assets/images/logo.png'), fit: BoxFit.cover),
              ),
            ),
            onTap: () {
              print('点击头像');
              // 打开弹出菜单
            },
          ),
          NavItem(
            icon: Iconfont.xinxi,
            title: loc.chat,
            isActive: currentRoute.startsWith("Chat"),
            onTap: () {
              context.router.replaceAll([ChatRoute()]);
            },
          ),
          NavItem(
            icon: Iconfont.moxing,
            title: loc.demo,
            isActive: currentRoute.startsWith("Demo"),
            onTap: () {
              context.router.replaceAll([DemoRoute()]);
            },
          ),
          NavItem(
            icon: Iconfont.picture,
            title: loc.demo,
            isActive: false,
            onTap: () {
              // context.router.replaceAll([DemoRoute()]);
            },
          ),
          NavItem(
            icon: Iconfont.fanyi,
            title: loc.demo,
            isActive: false,
            onTap: () {
              // context.router.replaceAll([DemoRoute()]);
            },
          ),
          NavItem(
            icon: Iconfont.app,
            title: loc.demo,
            isActive: false,
            onTap: () {
              // context.router.replaceAll([DemoRoute()]);
            },
          ),
          Expanded(child: SizedBox()),
          // 明暗切换
          NavItem(
            icon:
                brightness == ThemeMode.dark
                    ? Iconfont.yueliang
                    : brightness == ThemeMode.light
                    ? Iconfont.taiyang
                    : Iconfont.auto_l,
            title: loc.theme,
            isActive: false,
            onTap: () {
              // 获取当前系统明暗状态
              var platformBrightness = MediaQuery.of(context).platformBrightness;
              if (brightness == ThemeMode.system) {
                BrightnessStore.change(ref, platformBrightness == Brightness.dark ? "light" : "dark");
              } else {
                BrightnessStore.toggle(ref);
              }
            },
          ),
          // 设置页面
          NavItem(
            icon: Iconfont.github,
            title: loc.github,
            isActive: false,
            onTap: () {
              launchUrl(Uri.parse("https://github.com/yh4922/simple-chat"));
            },
          ),
          // // 设置页面
          // NavItem(
          //   icon: Iconfont.shezhi,
          //   title: loc.settings,
          //   isActive: false,
          //   onTap: () {
          //     // 跳转设置页面
          //   },
          // ),
          // 安全区域
          SizedBox(height: MediaQuery.of(context).padding.bottom + 10),
        ],
      ),
    );
    if (kIsWeb) {
      return liftSide;
    }
    return DragToMoveArea(child: liftSide);
  }
}
