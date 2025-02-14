import 'package:auto_route/auto_route.dart';
import 'package:simple_chat/router/router.gr.dart';

// part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  // 重写defaultRouteType
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override // 路由
  List<AutoRoute> get routes {
    return [
      // 首页路由
      AutoRoute(path: "/", page: HomeRoute.page),
    ];
  }
}
