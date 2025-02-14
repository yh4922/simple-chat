import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:simple_chat/states/locale/locale.dart';
import 'package:simple_chat/i18n/generated/l10n.dart';
import 'router/router.dart';

void main() {
  runApp(
    // 使用ProviderScope包裹MyApp
    ProviderScope(
      child: MyApp(), // 使用MyApp作为子组件
    ),
  );
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  // 导入路由
  final rootRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 语言
    final appLocale = LocaleData.value(ref);

    return MaterialApp.router(
      // 使用路由
      routerConfig: rootRouter.config(),
      // 导入国际化
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizationDelegate(),
      ],
      // 解析语言回调
      localeResolutionCallback: (Locale? locale, Iterable<Locale> supportedLocales) {
        // 获取系统语言 并从支持的语言中查找 存在则返回
        var result = supportedLocales.where((element) => element.languageCode == locale?.languageCode);
        if (result.isNotEmpty) {
          return locale;
        }

        // 不存在则返回默认语言
        return Locale('en');
      },
      locale: appLocale,
      // 系统语言切换回调
      localeListResolutionCallback: (List<Locale>? locales, Iterable<Locale> supportedLocales) {
        // print('locales:$locales');
        // print('supportLocales:$supportedLocales');
      },
      supportedLocales: [
        Locale('zh'), // Chinese
        Locale('en'), // English
      ],
    );
  }
}
