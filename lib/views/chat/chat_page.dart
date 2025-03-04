import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_chat/widgets/adaptive_page/adaptive_page.dart';
import 'package:simple_chat/widgets/chat_list/chat_list.dart';

/// 继承 ConsumerWidget
@RoutePage()
class ChatPage extends ConsumerWidget {
  ChatPage({super.key});

  final expandCollapseSidebar = StateProvider<bool>((ref) => false);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AdaptivePage(
      name: "Chat",
      sidebarWidth: 260,
      sidebar: ChatList(ref: ref, expandCollapseSidebar: expandCollapseSidebar),
      body: AutoRouter(
        placeholder: (context) {
          return Center(child: Icon(Icons.chat_bubble_outline, size: 48, color: Colors.red));
        },
      ),
    );
  }
}
