import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:simple_chat/states/brightness/brightness.dart';
import 'package:simple_chat/states/locale/locale.dart';
import 'package:simple_chat/states/theme/theme.dart';
import 'package:simple_chat/i18n/generated/l10n.dart';
import 'package:window_manager/window_manager.dart';
// import 'package:jh_debug/jh_debug.dart';
import 'package:simple_chat/utils/store.dart';
import 'router/router.dart';

void main() async {
  // 设置 Zone 错误为致命错误（可选）
  BindingBase.debugZoneErrorsAreFatal = true;

  // 确保在同一个 zone 中初始化
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      // 判断是否桌面端
      Store.isDesktop =
          defaultTargetPlatform == TargetPlatform.windows ||
          defaultTargetPlatform == TargetPlatform.macOS ||
          defaultTargetPlatform == TargetPlatform.linux;

      // print('Store.isDesktop: ${Store.isDesktop}');
      // 桌面端初始化
      if (!kIsWeb && Store.isDesktop) {
        await windowManager.ensureInitialized();
        windowManager.hide();

        WindowOptions windowOptions = WindowOptions(
          size: Size(1200, 700),
          center: true,
          backgroundColor: Colors.transparent,
          skipTaskbar: false,
          titleBarStyle: TitleBarStyle.hidden,
          windowButtonVisibility: true,
        );
        windowManager.waitUntilReadyToShow(windowOptions, () async {
          await windowManager.setAsFrameless();
          await windowManager.show();
          await windowManager.focus();
        });
      }

      // 初始缓存
      await Store.init();

      // jhDebugMain(
      //   appChild: ProviderScope(child: MyApp()),
      //   debugMode: DebugMode.inConsole,
      //   errorCallback: (error) {
      //     // 错误处理
      //   },
      // );
      runApp(ProviderScope(child: MyApp()));
      // print('Store.isDesktop: ${Store.isDesktop}');
      // runApp(ProviderScope(child: DemoApp()));
    },
    (error, stack) {
      // 处理未捕获的异常
      // print('未捕获的错误: $error');
      // print('堆栈跟踪: $stack');
    },
  );
}

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        //
        backgroundColor: Colors.transparent,
        body: DragToMoveArea(child: Center(child: Text('Hello World'))),
      ),
    );
  }
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  // 导入路由
  final rootRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 全局ref绑定到router上 方便路由修改时同步状态
    AppRouter.ref = ref;
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
      supportedLocales: LocaleData.supportedLocales,
      debugShowCheckedModeBanner: false,
    );
  }
}
