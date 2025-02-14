import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_chat/states/example/example.dart';
import 'package:simple_chat/states/locale/locale.dart';
import 'package:simple_chat/i18n/generated/l10n.dart';

/// 继承 ConsumerWidget
@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// 通过ExampleDataRef.value获取值
    final String exampleData = ExampleDataRef.value(ref);
    final loc = S.of(context);

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
              },
            ),
            ElevatedButton(
              child: Text('日历'),
              onPressed: () {
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
              onPressed: () {
                // 切换语言
                if (Localizations.localeOf(context).languageCode == 'zh') {
                  LocaleData.change(ref, Locale("en"));
                } else {
                  LocaleData.change(ref, Locale("zh"));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
