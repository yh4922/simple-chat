// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_Hant locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'zh_Hant';

  static String m0(name) => "你好, ${name}!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "add_ai_assistant": MessageLookupByLibrary.simpleMessage("添加AI助手"),
    "advanced_settings": MessageLookupByLibrary.simpleMessage("進階設定"),
    "appname": MessageLookupByLibrary.simpleMessage("SimpleChat"),
    "assistant_desc": MessageLookupByLibrary.simpleMessage("助手描述"),
    "assistant_desc_placeholder": MessageLookupByLibrary.simpleMessage(
      "簡短描述這個助手的功能和特點",
    ),
    "assistant_name": MessageLookupByLibrary.simpleMessage("助手名稱"),
    "assistant_name_placeholder": MessageLookupByLibrary.simpleMessage(
      "給你的AI助手起個名字",
    ),
    "assistant_setup": MessageLookupByLibrary.simpleMessage("助手設定"),
    "auto_reate_topic": MessageLookupByLibrary.simpleMessage("自動創建話題"),
    "auto_reate_topic_tips": MessageLookupByLibrary.simpleMessage(
      "如果開啟‘最大對話歷史’，當超過歷史對話數，則會自動創建對話",
    ),
    "auto_summary": MessageLookupByLibrary.simpleMessage("自動總結"),
    "auto_summary_tips": MessageLookupByLibrary.simpleMessage(
      "如果開啟‘最大對話歷史’，當超過歷史對話數，則會把歷史消息自動總結壓縮為一條",
    ),
    "chat": MessageLookupByLibrary.simpleMessage("聊天"),
    "chat_settings": MessageLookupByLibrary.simpleMessage("聊天設定"),
    "chat_style": MessageLookupByLibrary.simpleMessage("聊天樣式"),
    "close": MessageLookupByLibrary.simpleMessage("關閉"),
    "conversation_mode": MessageLookupByLibrary.simpleMessage("對話模式"),
    "custom_assistant": MessageLookupByLibrary.simpleMessage("自訂助手"),
    "dark": MessageLookupByLibrary.simpleMessage("暗色"),
    "default_assistant": MessageLookupByLibrary.simpleMessage("隨便聊聊"),
    "demo": MessageLookupByLibrary.simpleMessage("演示"),
    "document_mode": MessageLookupByLibrary.simpleMessage("文檔模式"),
    "exit": MessageLookupByLibrary.simpleMessage("退出"),
    "frequency_penalty": MessageLookupByLibrary.simpleMessage("詞彙豐富度"),
    "frequency_penalty_tips": MessageLookupByLibrary.simpleMessage(
      "值越大，用詞越豐富多樣；值越低，用詞更樸實簡單",
    ),
    "github": MessageLookupByLibrary.simpleMessage("GitHub"),
    "language": MessageLookupByLibrary.simpleMessage("繁體中文"),
    "light": MessageLookupByLibrary.simpleMessage("亮色"),
    "max_tokens": MessageLookupByLibrary.simpleMessage("單次回覆限制"),
    "max_tokens_tips": MessageLookupByLibrary.simpleMessage(
      "單次互動所用的最大 Token 數",
    ),
    "max_topic_history": MessageLookupByLibrary.simpleMessage("最大對話歷史"),
    "max_topic_history_tips": MessageLookupByLibrary.simpleMessage(
      "如果開啟當超過這個數量時,會自動截斷最久的消息",
    ),
    "message": m0,
    "model_name": MessageLookupByLibrary.simpleMessage("模型名稱"),
    "model_settings": MessageLookupByLibrary.simpleMessage("模型設定"),
    "please_enter": MessageLookupByLibrary.simpleMessage("請輸入"),
    "pre_input": MessageLookupByLibrary.simpleMessage("預輸入內容"),
    "pre_input_placeholder": MessageLookupByLibrary.simpleMessage(
      "預處理模版/{/{text/}/}將替換為即時輸入信息",
    ),
    "pre_input_tips": MessageLookupByLibrary.simpleMessage("用戶最新的一條消息會填充到此模板"),
    "presence_penalty": MessageLookupByLibrary.simpleMessage("表述發散度"),
    "presence_penalty_tips": MessageLookupByLibrary.simpleMessage(
      "值越大，越傾向不同的表達方式，避免概念重複；值越小，越傾向使用重複的概念或敘述，表達更具一致性",
    ),
    "providers": MessageLookupByLibrary.simpleMessage("提供者"),
    "reasoning_effort": MessageLookupByLibrary.simpleMessage("推理強度"),
    "reasoning_effort_tips": MessageLookupByLibrary.simpleMessage(
      "值越大，推理能力越強，但可能會增加響應時間和 Token 消耗",
    ),
    "role_settings": MessageLookupByLibrary.simpleMessage("角色設定"),
    "role_settings_placeholder": MessageLookupByLibrary.simpleMessage(
      "詳細描述助手的角色、專業領域、語氣風格等特點。",
    ),
    "role_settings_tips": MessageLookupByLibrary.simpleMessage(
      "詳細的角色設定可以讓AI助手更好地理解它的職責和行為方式",
    ),
    "search": MessageLookupByLibrary.simpleMessage("搜尋話題"),
    "settings": MessageLookupByLibrary.simpleMessage("設定"),
    "system": MessageLookupByLibrary.simpleMessage("系統"),
    "temperature": MessageLookupByLibrary.simpleMessage("創意活躍度"),
    "temperature_tips": MessageLookupByLibrary.simpleMessage(
      "數值越大，回答越有創意和想像力；數值越小，回答越嚴謹",
    ),
    "theme": MessageLookupByLibrary.simpleMessage("主題"),
    "title": MessageLookupByLibrary.simpleMessage("歡迎"),
    "top_p": MessageLookupByLibrary.simpleMessage("思維開放度"),
    "top_p_tips": MessageLookupByLibrary.simpleMessage(
      "考慮多少種可能性，值越大，接受更多可能的回答；值越小，傾向選擇最可能的回答。不推薦和創意活躍度一起更改",
    ),
    "translation": MessageLookupByLibrary.simpleMessage("翻譯"),
  };
}
