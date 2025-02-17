import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_chat/states/brightness/brightness.dart';
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

    var theme = ThemeStore.value(ref);

    return Center(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // 主题列表
                  children:
                      ThemeDatas.themeList
                          .map(
                            (e) => GestureDetector(
                              child: Container(
                                width: 40,
                                height: 40,
                                margin: EdgeInsets.only(right: 2),
                                decoration: BoxDecoration(
                                  color: e.main, // 显示
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.black),
                                ),
                                child: theme.name == e.name ? Icon(Icons.check) : null,
                              ),
                              onTap: () {
                                ThemeStore.change(ref, e.name);
                              },
                            ),
                          )
                          .toList(),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // 主题列表
                  children: [
                    GestureDetector(
                      child: Container(
                        width: 40,
                        height: 40,
                        margin: EdgeInsets.only(right: 2),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.black, // 显示
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Text("暗", style: TextStyle(color: Colors.white)),
                      ),
                      onTap: () {
                        BrightnessStore.change(ref, "dark");
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        width: 40,
                        height: 40,
                        margin: EdgeInsets.only(right: 2),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white, // 显示
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Text("亮", style: TextStyle(color: Colors.black)),
                      ),
                      onTap: () {
                        BrightnessStore.change(ref, "light");
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        width: 40,
                        height: 40,
                        margin: EdgeInsets.only(right: 2),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey, // 显示
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Text("系统", style: TextStyle(color: Colors.black)),
                      ),
                      onTap: () {
                        BrightnessStore.change(ref, "system");
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text("surface"),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface, //
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text("surface"),
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceBright,
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text("surfaceBright"),
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainer,
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text("surfaceContainer"),
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainerHigh,
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text("surfaceContainerHigh"),
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainerHighest,
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text("surfaceContainerHighest"),
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainerLow,
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text("surfaceContainerLow"),
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainerLowest,
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text("surfaceContainerLowest"),
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceDim, //
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text("surfaceDim"),
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceTint, //
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text("surfaceTint"),
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceVariant, //
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text("surfaceVariant"),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text("secondary"),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary, //
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text("secondary"),
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer, //
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text("secondaryContainer"),
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryFixed, //
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text("secondaryFixed"),
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryFixedDim, //
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text("secondaryFixedDim"),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text("error"),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.error, //
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text("error"),
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.errorContainer, //
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text("errorContainer"),
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.inversePrimary, //
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text("inversePrimary"),
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.inverseSurface, //
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text("inverseSurface"),
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onError, //
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text("onError"),
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onErrorContainer, //
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text("onErrorContainer"),
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onInverseSurface, //
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text("onInverseSurface"),
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary, //
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text("onPrimary"),
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSecondary, //
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text("onSecondary"),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text("primary"),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary, //
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text("primary"),
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer, //
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text("primaryContainer"),
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryFixed, //
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text("primaryFixed"),
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryFixedDim, //
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text("primaryFixedDim"),
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary, //
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text("onPrimary"),
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimaryContainer, //
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text("onPrimaryContainer"),
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimaryFixed, //
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text("onPrimaryFixed"),
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimaryFixedVariant, //
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text("onPrimaryFixedVariant"),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text("tertiary"),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.tertiary, //
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text("tertiary"),
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.tertiaryContainer, //
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text("tertiaryContainer"),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text("surface"),
                    Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface, //
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text("surface"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
