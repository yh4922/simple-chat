import 'package:auto_route/auto_route.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:jh_debug/jh_debug.dart';
import 'package:simple_chat/router/router.gr.dart';

// part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  // TODO: implement navigatorKey
  GlobalKey<NavigatorState> get navigatorKey => jhDebug.getNavigatorKey;
  // 重写defaultRouteType
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override // 路由
  List<AutoRoute> get routes {
    return [
      // 首页路由
      AutoRoute(
        // 默认
        path: "/",
        page: DefaultLayout.page,
        children: [
          AutoRoute(
            // 首页
            path: '',
            page: HomeRoute.page,
          ),
        ],
      ),
    ];
  }
}
