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
