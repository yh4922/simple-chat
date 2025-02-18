import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_chat/states/brightness/brightness.dart';
// import 'package:simple_chat/states/example/example.dart';
import 'package:simple_chat/states/theme/theme.dart';
// import 'package:simple_chat/i18n/generated/l10n.dart';
import 'package:simple_chat/theme/index_theme.dart';
import 'package:jh_debug/jh_debug.dart';

/// 继承 ConsumerWidget
@RoutePage()
class DemoPage extends ConsumerWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          child: Text('Hello World', style: TextStyle(fontSize: 24, color: Theme.of(context).colorScheme.onBackground)),
        ),
        Positioned(
          left: 16,
          top: 16,
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              context.router.back();
            },
          ),
        ),
      ],
    );
  }
}
