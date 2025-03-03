import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:simple_chat/router/router.dart';
import 'package:simple_chat/states/brightness/brightness.dart';
import 'package:simple_chat/utils/store.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_chat/widgets/iconfont/iconfont.dart';
import 'package:auto_route/auto_route.dart';
import 'package:simple_chat/states/routes/routes.dart';
import 'package:simple_chat/i18n/generated/l10n.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class NavItem extends StatefulWidget {
  /// 图标
  final IconData icon;

  /// 标题
  final String title;

  /// 是否激活
  final bool isActive;

  /// 点击事件
  final VoidCallback onTap;
  final double top;
  const NavItem({super.key, required this.icon, required this.title, required this.isActive, required this.onTap, this.top = 14});

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  Timer? _timer;
  Function()? cancel;

  void showTips() {
    if (mounted) {
      setState(() {
        cancel = BotToast.showAttachedWidget(
          targetContext: context,
          preferDirection: PreferDirection.rightCenter,
          attachedBuilder: (_) {
            return Container(
              margin: EdgeInsets.only(top: widget.top, left: 12),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inverseSurface,
                borderRadius: BorderRadius.circular(6), //
              ),
              child: Text(
                widget.title,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onInverseSurface, //
                  fontSize: 14,
                  height: 2.2,
                ),
              ),
            );
          },
        );
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    if (cancel != null) {
      cancel!();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.only(top: widget.top),
      child: Material(
        color: widget.isActive ? color.primaryContainer.withAlpha(100) : color.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(6),
        child: MouseRegion(
          onEnter: (e) {
            _timer = Timer(Duration(milliseconds: 300), showTips);
          },
          onExit: (e) {
            _timer?.cancel();
            if (cancel != null) {
              cancel!();
            }
            setState(() {
              cancel = null;
            });
          },
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(6),
            child: SizedBox(width: 34, height: 34, child: Icon(widget.icon, size: 20, color: Theme.of(context).colorScheme.primary)),
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
        color: Theme.of(context).colorScheme.surfaceContainerLowest,
        border: Border(right: BorderSide(color: Theme.of(context).colorScheme.outlineVariant)),
      ),
      child: Stack(
        children: [
          Store.isDesktop ? DragToMoveArea(child: SizedBox.expand()) : SizedBox.expand(),
          SafeArea(
            child: SizedBox.expand(
              child: Column(
                // 啊啥的
                children: [
                  // 安全区域
                  SizedBox(height: MediaQuery.of(context).padding.top + 20),
                  // 头像
                  Listener(
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(6),
                        image: DecorationImage(image: AssetImage('assets/images/logo.png'), fit: BoxFit.cover),
                      ),
                    ),
                    onPointerUp: (e) {
                      // 判断鼠标是否在组件范围内
                      final RenderBox box = context.findRenderObject() as RenderBox;
                      final Offset localPosition = box.globalToLocal(e.position);
                      final bool isInside = box.size.contains(localPosition);
                      if (isInside) {
                        // print("点击头像打开菜单");
                        // // 头像 名称
                        // 应用设置
                        // 导入配置
                        // 更新日志
                        // 多语言切换
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  NavItem(
                    icon: Iconfont.xinxi,
                    title: loc.chat,
                    isActive: currentRoute.startsWith("Chat"),
                    onTap: () {
                      if (currentRoute != "Chat") {
                        context.router.replaceAll([ChatRoute()]);
                      }
                    },
                  ),
                  NavItem(
                    icon: Iconfont.moxing,
                    title: loc.demo,
                    isActive: currentRoute.startsWith("Demo"),
                    onTap: () {
                      if (currentRoute != "Demo") {
                        context.router.replaceAll([HomeRoute()]);
                      }
                    },
                  ),
                  NavItem(
                    icon: Iconfont.picture,
                    title: loc.demo,
                    isActive: false,
                    onTap: () {
                      // asdas
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
                  // 退出按钮
                  NavItem(
                    icon: Iconfont.exit,
                    title: loc.exit,
                    isActive: false,
                    onTap: () async {
                      if (Store.isDesktop) {
                        await windowManager.close();
                      } else {
                        SystemNavigator.pop();
                      }
                    },
                  ),
                  // 安全区域
                  SizedBox(height: MediaQuery.of(context).padding.bottom + 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    return liftSide;
  }
}
