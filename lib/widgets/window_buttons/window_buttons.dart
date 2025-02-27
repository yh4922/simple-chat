import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_chat/states/locale/locale.dart';
import 'package:simple_chat/utils/store.dart';
import 'package:simple_chat/widgets/iconfont/iconfont.dart';
import 'package:window_manager/window_manager.dart';
import 'package:simple_chat/i18n/generated/l10n.dart';

class WindowButtons extends ConsumerWidget {
  const WindowButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var buttons = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(child: DragToMoveArea(child: SizedBox(height: Store.winBtnHeight, width: double.infinity))),
        // 支持的语言列表
        PopupMenuButton<String>(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(mainAxisSize: MainAxisSize.min, children: [Text(S.of(context).language), Icon(Icons.arrow_drop_down)]),
          ),
          itemBuilder:
              (context) =>
                  LocaleData.supportedLocales
                      .map(
                        (locale) => PopupMenuItem<String>(
                          value: locale.toString(),
                          child: Localizations.override(
                            context: context,
                            locale: locale,
                            child: Builder(builder: (context) => Text(Localizations.of(context, S).language)),
                          ),
                        ),
                      )
                      .toList(),
          onSelected: (locale) => LocaleData.change(ref, locale),
        ),
        WindowButtonIcon(
          icon: Iconfont.min,
          onTap: () async {
            await windowManager.minimize();
          },
        ),
        WindowButtonIcon(
          icon: Iconfont.max,
          onTap: () async {
            var max = await windowManager.isMaximized();
            if (max) {
              await windowManager.unmaximize();
            } else {
              await windowManager.maximize();
            }
          },
        ),
        WindowButtonIcon(
          close: true,
          icon: Iconfont.close,
          onTap: () async {
            await windowManager.close();
          },
        ),
      ],
    );

    return buttons;
  }
}

class WindowButtonIcon extends StatefulWidget {
  final IconData icon;
  final Future<void> Function() onTap;
  final bool close;
  const WindowButtonIcon({
    //
    super.key,
    required this.icon,
    required this.onTap,
    this.close = false,
  });

  @override
  State<WindowButtonIcon> createState() => _WindowButtonIconState();
}

class _WindowButtonIconState extends State<WindowButtonIcon> {
  bool hover = false;
  int buttonKey = 0;

  @override
  Widget build(BuildContext context) {
    var hoverColor = widget.close ? Theme.of(context).colorScheme.error : Theme.of(context).colorScheme.onSurface.withAlpha(50);
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          hover = true;
        });
      },
      onExit: (_) {
        setState(() {
          hover = false;
        });
      },
      child: Listener(
        behavior: HitTestBehavior.opaque,
        onPointerCancel: (_) {
          setState(() {
            buttonKey = 0;
          });
        },
        onPointerDown: (e) {
          setState(() {
            buttonKey = e.buttons;
          });
        },
        onPointerUp: (e) {
          // 判断鼠标是否在组件范围内
          final RenderBox box = context.findRenderObject() as RenderBox;
          final Offset localPosition = box.globalToLocal(e.position);
          final bool isInside = box.size.contains(localPosition);

          if (isInside) {
            if (Store.isDesktop && buttonKey != 1) {
              return; // 只处理左键点击
            }
            widget.onTap.call();
          }

          setState(() {
            buttonKey = e.buttons;
          });
        },
        child: Container(
          height: Store.winBtnHeight,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 15),
          color: hover ? hoverColor : null,
          child: Icon(
            widget.icon,
            size: 10,
            // 关闭按钮颜色不一样
            color: hover && widget.close ? Theme.of(context).colorScheme.onError : null,
          ),
        ),
      ),
    );
  }
}
