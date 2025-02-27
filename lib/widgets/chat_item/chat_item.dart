import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_chat/i18n/generated/l10n.dart';
// import 'package:simple_chat/utils/store.dart';

class ChatList extends StatelessWidget {
  final WidgetRef ref;
  final StateProvider<bool> expandCollapseSidebar;
  const ChatList({super.key, required this.ref, required this.expandCollapseSidebar});

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    return Container(
      width: 220, // 在移动端 这个就要占满独占一页面 点击后 隐藏 展示聊天内容
      height: double.infinity,
      decoration: BoxDecoration(border: Border(right: BorderSide(color: Theme.of(context).colorScheme.outlineVariant, width: 1.0))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border(
                // bottom: BorderSide(color: Theme.of(context).colorScheme.secondaryFixed, width: 1.0),
              ),
            ),
            child: Text(
              locale.appname,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                // FontWeight
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
