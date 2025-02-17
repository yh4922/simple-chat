import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_chat/theme/index_theme.dart';

class Store {
  // 缓存实例  初始化时设置 全局调用
  static late SharedPreferences prefs;

  // 语言标识
  static String localeName = "en";
  static Locale locale = Locale('en');

  // 主题标识
  static String themeName = "bluegrey";
  static ThemeDatas theme = ThemeDatas.findByName('bluegrey');

  // 明暗标识
  static String brightnessName = "light";
  static ThemeMode brightness = ThemeMode.light;

  // 初始化
  static Future<void> init() async {
    // 创建实例
    prefs = await SharedPreferences.getInstance();
    // 获取语言标识
    localeName = prefs.getString("localeName") ?? "en";
    locale = Locale(localeName);
    // 获取主题标识
    ThemeDatas.themeList = themeList;
    themeName = prefs.getString("themeName") ?? "bluegrey";
    theme = ThemeDatas.findByName(themeName);
    // 获取明暗标识
    brightnessName = prefs.getString("brightnessName") ?? "light";
    if (brightnessName == "light") {
      brightness = ThemeMode.light;
    } else if (brightnessName == "dark") {
      brightness = ThemeMode.dark;
    } else {
      brightness = ThemeMode.system;
    }
  }
}
