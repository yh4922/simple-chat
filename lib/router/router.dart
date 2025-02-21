import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jh_debug/jh_debug.dart';
import 'package:simple_chat/router/router.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_chat/states/routes/routes.dart';

export 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  // 添加动画开关
  static const bool enableTransitions = true;
  // 全局ref
  static late WidgetRef ref;

  @override
  GlobalKey<NavigatorState> get navigatorKey => jhDebug.getNavigatorKey;

  /// /chat/:chatid
  /// /setting/common  通用设置  主题 亮色暗色  语言   字体大小?
  /// /setting/assistant   内置助手设置 话题命名  消息翻译  总结压缩上下文  生成助理信息  知识库压缩？
  /// /setting/provider  AI提供商管理   每个提供商启用 设置密钥等
  /// /setting/voice  语音服务 ？？
  /// /setting/default  默认助手
  ///

  @override // 路由
  List<AutoRoute> get routes {
    return [
      // 首页路由
      AutoRoute(
        path: "/",
        page: DefaultLayout.page,
        children: [
          AutoRoute(
            // chat页面
            path: 'Chat',
            initial: true,
            page: ChatRoute.page,
            children: [AutoRoute(path: 'ChatDetail', page: ChatDetailRoute.page)],
          ),
          // DEMO页面
          AutoRoute(path: 'Demo', page: DemoRoute.page),
        ],
      ),
    ];
  }

  @override
  late final List<AutoRouteGuard> guards = [
    AutoRouteGuard.simple((resolver, router) {
      // 设置同步
      try {
        var name = resolver.route.path;
        if (name == "/") {
          name = "Chat";
        }
        RoutesData.change(ref, name);
      } catch (e) {
        // Debug
      }
      resolver.next();
    }),
  ];
}
