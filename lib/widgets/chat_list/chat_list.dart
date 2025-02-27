import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_chat/states/routes/routes.dart';
import 'package:simple_chat/states/window/size.dart';
// import 'package:simple_chat/i18n/generated/l10n.dart';
import 'package:simple_chat/utils/store.dart';
// import 'package:simple_chat/widgets/iconfont/iconfont.dart';
import 'package:window_manager/window_manager.dart';

class ChatList extends ConsumerWidget {
  final WidgetRef ref;
  final StateProvider<bool> expandCollapseSidebar;
  const ChatList({super.key, required this.ref, required this.expandCollapseSidebar});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final locale = S.of(context);

    var top = MediaQuery.of(context).padding.top;
    var size = WinSizeData.value(ref);
    var routePath = RoutesData.value(ref);

    return Container(
      height: double.infinity,
      padding: EdgeInsets.only(top: top + Store.winBtnHeight),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(right: BorderSide(color: Theme.of(context).colorScheme.outlineVariant, width: 1.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 5, right: 5),
            height: 50,
            decoration: BoxDecoration(
              // color: Colors.red,
              border: Border(
                // bottom: BorderSide(color: Theme.of(context).colorScheme.secondaryFixed, width: 1.0),
              ),
            ),
            child: Stack(
              children: [
                Store.isDesktop ? DragToMoveArea(child: SizedBox.expand()) : SizedBox.expand(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 34,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "搜索话题${WinSizeData.isOnePage(size)}",
                            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none),
                            fillColor: Theme.of(context).colorScheme.surfaceContainer,
                            filled: true,
                            // isDense: true,
                          ),
                          style: TextStyle(fontSize: 14),
                          onSubmitted: (text) {
                            // print("触发搜索 $text");
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Material(
                      color: Theme.of(context).colorScheme.surfaceContainer,
                      borderRadius: BorderRadius.circular(6),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(6),
                        onTap: () {
                          // print("打开创建助手弹窗");
                        },
                        child: SizedBox(
                          width: 34,
                          height: 34,
                          child: Center(
                            child: Icon(Icons.add, size: 18), //
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(routePath),
          ElevatedButton(
            onPressed: () {
              context.router.pushPath("ChatDetail/1");
            },
            child: Text('跳转路由A'),
          ),
          ElevatedButton(
            onPressed: () {
              context.router.pushPath("ChatDetail/2");
            },
            child: Text('跳转路由B'),
          ),
        ],
      ),
    );
  }
}
