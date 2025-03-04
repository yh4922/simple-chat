import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_chat/states/locale/locale.dart';
import 'package:simple_chat/theme/index_theme.dart';

class Store {
  // 缓存实例  初始化时设置 全局调用
  static late SharedPreferences prefs;

  // 是否是桌面端
  static bool isDesktop = false;
  static bool isWin = false;
  static bool isMac = false;
  static bool isLinux = false;
  // 屏幕尺寸
  static Size winSize = Size(1280, 720);

  static bool get isWinOrLinux => isWin || isLinux;

  // 窗口控制按钮高度  win和linux 才有
  static double winBtnHeight = 20;

  // 语言标识
  static String localeName = "en";
  static Locale locale = Locale('en');

  // 主题标识
  static String themeName = "bluegrey";
  static ThemeDatas theme = ThemeDatas.findByName('bluegrey');

  // 明暗标识
  static String brightnessName = "light";
  static ThemeMode brightness = ThemeMode.light;

  /// 全局运行时变量
  static Map<String, dynamic> globalData = {};

  /// 获取全局变量
  static dynamic getGlobal(String name) {
    return globalData[name];
  }

  /// 获取全局变量
  static setGlobal(String name, dynamic value) {
    globalData[name] = value;
  }

  /// 获取全局变量
  static delGlobal(String name) {
    globalData.remove(name);
  }

  /// 从缓存获取 JSON 对象
  static Map<String, dynamic>? getJSON(String name) {
    // 获取字符串
    var jsonText = prefs.getString(name);
    if (jsonText == null) return null;

    // 转换为 Map
    return json.decode(jsonText);
  }

  /// 设置 JSON 对象
  static void setJSON(String name, Map<String, dynamic> value) {
    // 转换为字符串
    var jsonText = json.encode(value);
    // 设置值
    prefs.setString(name, jsonText);
  }

  /// 删除 JSON 对象
  static void delJSON(String name) {
    // 删除值
    prefs.remove(name);
  }
  

  // 初始化
  static Future<void> init() async {
    // 创建实例
    prefs = await SharedPreferences.getInstance();
    // 获取语言标识
    localeName = prefs.getString("localeName") ?? "en";
    locale = LocaleData.getLocale(localeName);
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
