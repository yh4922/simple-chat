import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LeftSide extends ConsumerWidget {
  const LeftSide({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 60,
      color: Theme.of(context).colorScheme.surfaceContainer,
      child: Column(
        // 啊啥的
        children: [Text("123")],
      ),
    );
  }
}
