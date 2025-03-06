// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh locale. All the
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
  String get localeName => 'zh';

  static String m0(name) => "你好, ${name}!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "add_ai_assistant": MessageLookupByLibrary.simpleMessage("添加AI助手"),
    "advanced_settings": MessageLookupByLibrary.simpleMessage("高级设置"),
    "appname": MessageLookupByLibrary.simpleMessage("SimpleChat"),
    "assistant_desc": MessageLookupByLibrary.simpleMessage("助手描述"),
    "assistant_desc_placeholder": MessageLookupByLibrary.simpleMessage(
      "简短描述这个助手的功能和特点",
    ),
    "assistant_name": MessageLookupByLibrary.simpleMessage("助手名称"),
    "assistant_name_placeholder": MessageLookupByLibrary.simpleMessage(
      "给你的AI助手起个名字",
    ),
    "assistant_setup": MessageLookupByLibrary.simpleMessage("助手设定"),
    "auto_reate_topic": MessageLookupByLibrary.simpleMessage("自动创建话题"),
    "auto_reate_topic_tips": MessageLookupByLibrary.simpleMessage(
      "如果开启‘最大对话历史’，当超过历史对话数，则会自动创建对话",
    ),
    "auto_summary": MessageLookupByLibrary.simpleMessage("自动总结"),
    "auto_summary_tips": MessageLookupByLibrary.simpleMessage(
      "如果开启‘最大对话历史’，当超过历史对话数，则会把历史消息自动总结压缩为一条",
    ),
    "chat": MessageLookupByLibrary.simpleMessage("聊天"),
    "chat_settings": MessageLookupByLibrary.simpleMessage("聊天设置"),
    "chat_style": MessageLookupByLibrary.simpleMessage("聊天样式"),
    "close": MessageLookupByLibrary.simpleMessage("关闭"),
    "conversation_mode": MessageLookupByLibrary.simpleMessage("对话模式"),
    "custom_assistant": MessageLookupByLibrary.simpleMessage("自定义助手"),
    "dark": MessageLookupByLibrary.simpleMessage("暗色"),
    "default_assistant": MessageLookupByLibrary.simpleMessage("随便聊聊"),
    "demo": MessageLookupByLibrary.simpleMessage("演示"),
    "document_mode": MessageLookupByLibrary.simpleMessage("文档模式"),
    "exit": MessageLookupByLibrary.simpleMessage("退出"),
    "frequency_penalty": MessageLookupByLibrary.simpleMessage("词汇丰富度"),
    "frequency_penalty_tips": MessageLookupByLibrary.simpleMessage(
      "值越大，用词越丰富多样；值越低，用词更朴实简单",
    ),
    "github": MessageLookupByLibrary.simpleMessage("GitHub"),
    "language": MessageLookupByLibrary.simpleMessage("简体中文"),
    "light": MessageLookupByLibrary.simpleMessage("亮色"),
    "max_tokens": MessageLookupByLibrary.simpleMessage("单次回复限制"),
    "max_tokens_tips": MessageLookupByLibrary.simpleMessage(
      "单次交互所用的最大 Token 数",
    ),
    "max_topic_history": MessageLookupByLibrary.simpleMessage("最大对话历史"),
    "max_topic_history_tips": MessageLookupByLibrary.simpleMessage(
      "如果开启当超过这个数量时,会自动截断最久的消息",
    ),
    "message": m0,
    "model_name": MessageLookupByLibrary.simpleMessage("模型名称"),
    "model_settings": MessageLookupByLibrary.simpleMessage("模型设置"),
    "please_enter": MessageLookupByLibrary.simpleMessage("请输入"),
    "pre_input": MessageLookupByLibrary.simpleMessage("预输入内容"),
    "pre_input_placeholder": MessageLookupByLibrary.simpleMessage(
      "预处理模版/{/{text/}/}将替换为实时输入信息",
    ),
    "pre_input_tips": MessageLookupByLibrary.simpleMessage("用户最新的一条消息会填充到此模板"),
    "presence_penalty": MessageLookupByLibrary.simpleMessage("表述发散度"),
    "presence_penalty_tips": MessageLookupByLibrary.simpleMessage(
      "值越大，越倾向不同的表达方式，避免概念重复；值越小，越倾向使用重复的概念或叙述，表达更具一致性",
    ),
    "providers": MessageLookupByLibrary.simpleMessage("提供商"),
    "reasoning_effort": MessageLookupByLibrary.simpleMessage("推理强度"),
    "reasoning_effort_tips": MessageLookupByLibrary.simpleMessage(
      "值越大，推理能力越强，但可能会增加响应时间和 Token 消耗",
    ),
    "role_settings": MessageLookupByLibrary.simpleMessage("角色设定"),
    "role_settings_placeholder": MessageLookupByLibrary.simpleMessage(
      "详细描述助手的角色、专业领域、语气风格等特点.",
    ),
    "role_settings_tips": MessageLookupByLibrary.simpleMessage(
      "详细的角色设定可以让AI助手更好地理解它的职责和行为方式",
    ),
    "search": MessageLookupByLibrary.simpleMessage("搜索话题"),
    "settings": MessageLookupByLibrary.simpleMessage("设置"),
    "system": MessageLookupByLibrary.simpleMessage("系统"),
    "temperature": MessageLookupByLibrary.simpleMessage("创意活跃度"),
    "temperature_tips": MessageLookupByLibrary.simpleMessage(
      "数值越大，回答越有创意和想象力；数值越小，回答越严谨",
    ),
    "theme": MessageLookupByLibrary.simpleMessage("主题"),
    "title": MessageLookupByLibrary.simpleMessage("欢迎"),
    "top_p": MessageLookupByLibrary.simpleMessage("思维开放度"),
    "top_p_tips": MessageLookupByLibrary.simpleMessage(
      "考虑多少种可能性，值越大，接受更多可能的回答；值越小，倾向选择最可能的回答。不推荐和创意活跃度一起更改",
    ),
    "translation": MessageLookupByLibrary.simpleMessage("翻译"),
  };
}
