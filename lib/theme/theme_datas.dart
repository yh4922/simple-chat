part of 'index_theme.dart';

class ThemeDatas {
  // 颜色列表
  static List<ThemeDatas> themeList = [];

  /// 私有变量
  // 颜色名称
  late String name;
  // 主色
  late Color main;
  // 亮色
  late ThemeData light;
  // 暗色
  late ThemeData dark;
  ThemeDatas({required this.name, required this.main, required this.light, required this.dark});

  /// 从主色生成主题
  static ThemeDatas fromMain(String name, Color mainColor) {
    ThemeDatas theme = ThemeDatas(
      name: name,
      main: mainColor,
      light: ThemeData(
        useMaterial3: true,
        visualDensity: VisualDensity.comfortable,
        fontFamily: "MiSans",
        colorScheme: ColorScheme.fromSeed(
          // 主色调
          seedColor: mainColor,
          // 明暗模式
          brightness: Brightness.light,
        ),
      ),
      dark: ThemeData(
        useMaterial3: true,
        visualDensity: VisualDensity.comfortable,
        fontFamily: "MiSans",
        colorScheme: ColorScheme.fromSeed(
          // 主色调
          seedColor: mainColor,
          // 明暗模式
          brightness: Brightness.dark,
        ),
      ),
    );
    return theme;
  }

  /// 根据名称查找主题
  static ThemeDatas findByName(String name) {
    ThemeDatas theme = ThemeDatas.themeList.firstWhere(
      // 如果找到主题 返回主题
      (element) => element.name == name,
      // 如果没有找到主题 返回默认主题
      orElse: () => ThemeDatas.themeList.first,
    );
    return theme;
  }
}
