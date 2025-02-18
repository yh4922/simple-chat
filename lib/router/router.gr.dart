// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:simple_chat/layout/default.dart' as _i1;
import 'package:simple_chat/views/demo/demo_page.dart' as _i2;
import 'package:simple_chat/views/home/home_page.dart' as _i3;

/// generated route for
/// [_i1.DefaultLayout]
class DefaultLayout extends _i4.PageRouteInfo<void> {
  const DefaultLayout({List<_i4.PageRouteInfo>? children})
    : super(DefaultLayout.name, initialChildren: children);

  static const String name = 'DefaultLayout';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.DefaultLayout();
    },
  );
}

/// generated route for
/// [_i2.DemoPage]
class DemoRoute extends _i4.PageRouteInfo<void> {
  const DemoRoute({List<_i4.PageRouteInfo>? children})
    : super(DemoRoute.name, initialChildren: children);

  static const String name = 'DemoRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.DemoPage();
    },
  );
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomePage();
    },
  );
}
