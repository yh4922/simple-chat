import 'package:flutter/material.dart';
// 以下你配置的全局主题颜色参数
part 'theme_bluegrey.dart';
part 'theme_lightblue.dart';
part 'theme_pink.dart';

Map<String, ThemeData> ThemeMaps = {
  // 蓝色主题
  "bluegrey": themeBlueGrey,
  // 浅蓝色主题
  "lightblue": themeLightBlue,
  // 粉色主题
  "pink": themePink,
};
