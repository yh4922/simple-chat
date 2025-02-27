import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_chat/router/router.gr.dart';

/// 继承 ConsumerWidget
@RoutePage()
class ChatDetailPage extends ConsumerStatefulWidget {
  final int id;
  const ChatDetailPage({super.key, required this.id});

  @override
  ConsumerState<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends ConsumerState<ChatDetailPage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Column(
        children: [
          SizedBox(height: 100),
          IconButton(
            onPressed: () {
              context.router.replaceAll([ChatRoute()]);
            },
            icon: Icon(Icons.navigate_before),
          ),
          // 标题
          Text("${widget.id}"),
          const Placeholder(),
        ],
      ),
    );
  }
}
