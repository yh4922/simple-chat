import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 继承 ConsumerWidget
@RoutePage()
class DemoPage extends ConsumerWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Provider
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          child: Text('Hello World', style: TextStyle(fontSize: 24, color: Theme.of(context).colorScheme.primary)),
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
