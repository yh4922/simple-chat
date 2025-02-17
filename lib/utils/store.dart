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
  static ThemeData theme = ThemeMaps["bluegrey"]!;

  // 初始化
  static Future<void> init() async {
    // 创建实例
    prefs = await SharedPreferences.getInstance();
    // 获取语言标识
    localeName = prefs.getString("localeName") ?? "en";
    locale = Locale(localeName);
    // 获取主题标识
    themeName = prefs.getString("themeName") ?? "bluegrey";
    theme = ThemeMaps[themeName] ?? ThemeMaps["bluegrey"]!;
  }

  // 是否提前读取主题缓存
  static bool preRead = false;
}
