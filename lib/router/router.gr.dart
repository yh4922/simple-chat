// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:simple_chat/layout/default.dart' as _i3;
import 'package:simple_chat/views/chat/chat_detail_page.dart' as _i1;
import 'package:simple_chat/views/chat/chat_page.dart' as _i2;
import 'package:simple_chat/views/demo/demo_page.dart' as _i4;
import 'package:simple_chat/views/home/home_page.dart' as _i5;
import 'package:simple_chat/views/provider/provider_page.dart' as _i6;

/// generated route for
/// [_i1.ChatDetailPage]
class ChatDetailRoute extends _i7.PageRouteInfo<ChatDetailRouteArgs> {
  ChatDetailRoute({
    _i8.Key? key,
    required int id,
    List<_i7.PageRouteInfo>? children,
  }) : super(
         ChatDetailRoute.name,
         args: ChatDetailRouteArgs(key: key, id: id),
         initialChildren: children,
       );

  static const String name = 'ChatDetailRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChatDetailRouteArgs>();
      return _i1.ChatDetailPage(key: args.key, id: args.id);
    },
  );
}

class ChatDetailRouteArgs {
  const ChatDetailRouteArgs({this.key, required this.id});

  final _i8.Key? key;

  final int id;

  @override
  String toString() {
    return 'ChatDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i2.ChatPage]
class ChatRoute extends _i7.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({_i8.Key? key, List<_i7.PageRouteInfo>? children})
    : super(
        ChatRoute.name,
        args: ChatRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'ChatRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChatRouteArgs>(
        orElse: () => const ChatRouteArgs(),
      );
      return _i2.ChatPage(key: args.key);
    },
  );
}

class ChatRouteArgs {
  const ChatRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'ChatRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.DefaultLayout]
class DefaultLayout extends _i7.PageRouteInfo<void> {
  const DefaultLayout({List<_i7.PageRouteInfo>? children})
    : super(DefaultLayout.name, initialChildren: children);

  static const String name = 'DefaultLayout';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.DefaultLayout();
    },
  );
}

/// generated route for
/// [_i4.DemoPage]
class DemoRoute extends _i7.PageRouteInfo<void> {
  const DemoRoute({List<_i7.PageRouteInfo>? children})
    : super(DemoRoute.name, initialChildren: children);

  static const String name = 'DemoRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.DemoPage();
    },
  );
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.HomePage();
    },
  );
}

/// generated route for
/// [_i6.ProviderPage]
class ProviderRoute extends _i7.PageRouteInfo<void> {
  const ProviderRoute({List<_i7.PageRouteInfo>? children})
    : super(ProviderRoute.name, initialChildren: children);

  static const String name = 'ProviderRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.ProviderPage();
    },
  );
}
