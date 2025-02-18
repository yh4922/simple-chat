import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:jh_debug/jh_debug.dart';
import 'package:simple_chat/router/router.gr.dart';

// part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  // 添加动画开关
  static const bool enableTransitions = true;

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
          // 首页
          AutoRoute(path: '', page: HomeRoute.page, initial: true),
          // DEMO页面
          AutoRoute(path: 'demo', page: DemoRoute.page),
        ],
      ),
    ];
  }
}
