import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:simple_chat/states/brightness/brightness.dart';
import 'package:simple_chat/states/locale/locale.dart';
import 'package:simple_chat/states/theme/theme.dart';
import 'package:simple_chat/i18n/generated/l10n.dart';
import 'package:window_manager/window_manager.dart';
import 'package:jh_debug/jh_debug.dart';
import 'package:simple_chat/utils/store.dart';
import 'router/router.dart';

void main() async {
  // 初始化窗口管理
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = WindowOptions(
      size: Size(1200, 700),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.hidden,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  // 初始缓存
  await Store.init();

  jhDebugMain(
    // 使用ProviderScope包裹MyApp
    appChild: ProviderScope(
      // 使用MyApp作为子组件
      child: MyApp(),
    ),
    debugMode: DebugMode.inConsole,
    errorCallback: (error) {
      // 错误处理
    },
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
    final appTheme = ThemeStore.value(ref);
    final appBrightness = BrightnessStore.value(ref);

    return MaterialApp.router(
      // 使用主题
      theme: appTheme.light,
      darkTheme: appTheme.dark,
      themeMode: appBrightness,
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
        return null;
      },
      supportedLocales: [
        Locale('zh'), // Chinese
        Locale('en'), // English
      ],
    );
  }
}
