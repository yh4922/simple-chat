import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 继承 ConsumerWidget
@RoutePage()
class ChatDetailPage extends ConsumerWidget {
  const ChatDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      alignment: Alignment.center,
      child: Text('详情', style: TextStyle(fontSize: 24, color: Theme.of(context).colorScheme.primary)),
    );
  }
}
