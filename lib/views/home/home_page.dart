import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_chat/states/example/example.dart';
import 'package:simple_chat/states/locale/locale.dart';
import 'package:simple_chat/states/theme/theme.dart';
import 'package:simple_chat/i18n/generated/l10n.dart';
import 'package:simple_chat/theme/index_theme.dart';
import 'package:jh_debug/jh_debug.dart';

/// 继承 ConsumerWidget
@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// 通过ExampleDataRef.value获取值
    final String exampleData = ExampleDataRef.value(ref);
    final loc = S.of(context);

    // 初始化，建议在initState阶段执行一次即可
    jhDebug.init(
      context: context,
      // 指定默认调试窗口内的一些参数配置
      btnTitle1: '按钮1', // 定义按钮名称
      btnTap1: () {}, // 定义按钮触发事件
      customTabs: [
        CustomTabItem(
          title: '自定义tab专栏',
          // 自定义tab页面的内容
          widget: Container(color: Colors.white, child: Text('内容区')),
        ),
      ],
    );

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            // 使用exampleData
            Text(exampleData),
            ElevatedButton(
              child: Text(loc.message("Yohann")),
              onPressed: () {
                ExampleDataRef.setValue(ref, "Hello Riverpod");
                // jhDebug.showLog();
                jhDebug.showDebugBtn();
              },
            ),
            ElevatedButton(
              child: Text('日历'),
              onPressed: () {
                print(showDatePicker);
                showDatePicker(
                  // 日历
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
              },
            ),
            ElevatedButton(
              child: Text('切换语言'),
              onPressed: () async {
                // 切换语言
                if (Localizations.localeOf(context).languageCode == 'zh') {
                  LocaleData.change(ref, "en");
                } else {
                  LocaleData.change(ref, "zh");
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // 主题列表
              children: [
                // 蓝色
                GestureDetector(
                  child: Container(width: 50, height: 50, color: ThemeMaps["bluegrey"]!.colorScheme.primary),
                  onTap: () {
                    // 切换主题
                    ThemeStore.change(ref, "bluegrey");
                  },
                ),
                // 浅蓝色
                GestureDetector(
                  child: Container(width: 50, height: 50, color: ThemeMaps["lightblue"]!.colorScheme.primary),
                  onTap: () {
                    // 切换主题
                    ThemeStore.change(ref, "lightblue");
                  },
                ),
                // 粉色
                GestureDetector(
                  child: Container(width: 50, height: 50, color: ThemeMaps["pink"]!.colorScheme.primary),
                  onTap: () {
                    // 切换主题
                    ThemeStore.change(ref, "pink");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
