import 'package:flutter/material.dart';
import 'package:simple_chat/i18n/generated/l10n.dart';
import 'package:simple_chat/widgets/common_avatar/common_avatar.dart';
import 'emoji_data.dart';

class AvatarPopup extends StatefulWidget {
  /// 头像
  final String avatar;

  /// 关闭弹窗
  final void Function() cancel;

  /// 修改
  final void Function(String) onChange;
  const AvatarPopup({super.key, required this.cancel, required this.onChange, required this.avatar});

  @override
  State<AvatarPopup> createState() => _AvatarPopupState();
}

///

class _AvatarPopupState extends State<AvatarPopup> {
  late String avatar;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    avatar = widget.avatar;
  }

  void onSelect(String name) {
    widget.onChange(name);
    widget.cancel();
  }

  @override
  Widget build(BuildContext context) {
    // final locale = S.of(context);

    return Center(
      child: Container(
        margin: EdgeInsets.all(30), //
        padding: EdgeInsets.all(15), //
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Theme.of(context).colorScheme.shadow.withAlpha(100), spreadRadius: 0, blurRadius: 30, offset: Offset(0, 3)),
          ],
        ),
        width: 400,
        height: 500,
        child: Column(
          children: [
            // //
            // Row(
            //   children: [
            //     CommonAvatar(avatar: avatar, radius: 30), //
            //   ],
            // ),
            Expanded(
              child: DefaultTabController(
                length: 9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TabBar(
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      padding: EdgeInsets.all(0),
                      tabs: [
                        Tab(text: "😀"),
                        Tab(text: "👨‍🦱"),
                        Tab(text: "🐵"),
                        Tab(text: "🍖"),
                        Tab(text: "🗺️"),
                        Tab(text: "🎃"),
                        Tab(text: "📦️"),
                        Tab(text: "✡️"),
                        Tab(text: "🏳️"),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          EmojiList(emojiList: faceList, onSelect: onSelect),
                          EmojiList(emojiList: peopleList, onSelect: onSelect),
                          EmojiList(emojiList: animalList, onSelect: onSelect),
                          EmojiList(emojiList: foodList, onSelect: onSelect),
                          EmojiList(emojiList: locationList, onSelect: onSelect),
                          EmojiList(emojiList: activeList, onSelect: onSelect),
                          EmojiList(emojiList: itemList, onSelect: onSelect),
                          EmojiList(emojiList: symbolList, onSelect: onSelect),
                          EmojiList(emojiList: flagList, onSelect: onSelect),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
