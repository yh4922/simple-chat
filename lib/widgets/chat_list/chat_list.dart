import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatList extends StatelessWidget {
  final WidgetRef ref;
  final StateProvider<bool> expandCollapseSidebar;
  const ChatList({super.key, required this.ref, required this.expandCollapseSidebar});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: double.infinity,
      color: Colors.red,
      child: Column(
        children: [
          ElevatedButton.icon(
            onPressed: () {
              ref.read(expandCollapseSidebar.notifier).state = !ref.read(expandCollapseSidebar);
            },
            label: Text("expandCollapseSidebar"),
            icon: Icon(Icons.expand_more),
          ),
        ],
      ),
    );
  }
}
