import 'package:flutter/material.dart';
import 'package:simple_chat/i18n/generated/l10n.dart';
import 'package:simple_chat/models/assistant.dart';
import 'package:simple_chat/widgets/common_avatar/common_avatar.dart';

class ChatListItem extends StatelessWidget {
  final bool active;
  final Assistant assistant;
  const ChatListItem({super.key, this.active = false, required this.assistant});

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.circular(10);
    var activeColor = Theme.of(context).colorScheme.surfaceContainer.withAlpha(150);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      child: Material(
        color: active ? activeColor : Colors.transparent,
        borderRadius: borderRadius,
        child: InkWell(
          onTap: () {
            // print('onTap');
          },
          borderRadius: borderRadius,
          child: Container(
            height: 60,
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(borderRadius: borderRadius),
            child: Row(
              children: [
                CommonAvatar(avatar: "🤖", radius: 20),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 标题
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(assistant.id == 0 ? S.of(context).default_assistant : assistant.name),
                            Text(
                              "03-04",
                              style: TextStyle(fontSize: 10, color: Theme.of(context).colorScheme.onPrimaryContainer.withAlpha(80)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 2),
                      // 使用模型
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          assistant.model,
                          style: TextStyle(fontSize: 10, height: 1, color: Theme.of(context).colorScheme.onPrimaryContainer.withAlpha(100)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
