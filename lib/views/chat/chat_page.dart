import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_chat/i18n/generated/l10n.dart';
import 'package:simple_chat/states/locale/locale.dart';
import 'package:simple_chat/widgets/chat_list/chat_list.dart';

/// 继承 ConsumerWidget
@RoutePage()
class ChatPage extends ConsumerWidget {
  ChatPage({super.key});

  final expandCollapseSidebar = StateProvider<bool>((ref) => false);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = S.of(context);

    return Container(
      alignment: Alignment.center,
      child: Row(
        children: [
          Text("${locale.language}: ${ref.watch(expandCollapseSidebar)}"),

          // 对话列表
          ChatList(ref: ref, expandCollapseSidebar: expandCollapseSidebar),
          Text("${Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant', countryCode: 'TW')}"),
          // 对话详情
          Expanded(child: AutoRouter()),
          // 切换语言
          Column(
            children: [
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
            ],
          ),
        ],
      ),
    );
  }
}
