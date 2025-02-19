import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_chat/widgets/chat_list/chat_list.dart';

/// 继承 ConsumerWidget
@RoutePage()
class ChatPage extends ConsumerWidget {
  ChatPage({super.key});

  final expandCollapseSidebar = StateProvider<bool>((ref) => false);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        children: [
          Text("expandCollapseSidebar: ${ref.watch(expandCollapseSidebar)}"),
          // 对话列表
          ChatList(ref: ref, expandCollapseSidebar: expandCollapseSidebar),
          // 对话详情
          Expanded(child: AutoRouter()),
        ],
      ),
    );
  }
}
