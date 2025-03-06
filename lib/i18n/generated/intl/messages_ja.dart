// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ja locale. All the
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
  String get localeName => 'ja';

  static String m0(name) => "こんにちは、${name}さん！";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "add_ai_assistant": MessageLookupByLibrary.simpleMessage("AIアシスタントを追加"),
    "advanced_settings": MessageLookupByLibrary.simpleMessage("高度な設定"),
    "appname": MessageLookupByLibrary.simpleMessage("シンプルチャット"),
    "assistant_desc": MessageLookupByLibrary.simpleMessage("アシスタントの説明"),
    "assistant_desc_placeholder": MessageLookupByLibrary.simpleMessage(
      "このアシスタントの機能と特徴を簡潔に説明してください",
    ),
    "assistant_name": MessageLookupByLibrary.simpleMessage("アシスタント名"),
    "assistant_name_placeholder": MessageLookupByLibrary.simpleMessage(
      "あなたのAIアシスタントに名前を付けてください",
    ),
    "assistant_setup": MessageLookupByLibrary.simpleMessage("アシスタント設定"),
    "auto_reate_topic": MessageLookupByLibrary.simpleMessage("自動トピック作成"),
    "auto_reate_topic_tips": MessageLookupByLibrary.simpleMessage(
      "‘最大対話履歴’を有効にすると、履歴の対話数を超えた場合に自動的に対話が作成されます",
    ),
    "auto_summary": MessageLookupByLibrary.simpleMessage("自動要約"),
    "auto_summary_tips": MessageLookupByLibrary.simpleMessage(
      "‘最大対話履歴’を有効にすると、履歴の対話数を超えた場合に、過去のメッセージが自動的に要約されて1つに圧縮されます",
    ),
    "chat": MessageLookupByLibrary.simpleMessage("チャット"),
    "chat_settings": MessageLookupByLibrary.simpleMessage("チャット設定"),
    "chat_style": MessageLookupByLibrary.simpleMessage("チャットスタイル"),
    "close": MessageLookupByLibrary.simpleMessage("閉じる"),
    "conversation_mode": MessageLookupByLibrary.simpleMessage("対話モード"),
    "custom_assistant": MessageLookupByLibrary.simpleMessage("カスタムアシスタント"),
    "dark": MessageLookupByLibrary.simpleMessage("ダークモード"),
    "default_assistant": MessageLookupByLibrary.simpleMessage("気軽にお話ししましょう"),
    "demo": MessageLookupByLibrary.simpleMessage("デモ"),
    "document_mode": MessageLookupByLibrary.simpleMessage("ドキュメントモード"),
    "exit": MessageLookupByLibrary.simpleMessage("退出"),
    "frequency_penalty": MessageLookupByLibrary.simpleMessage("語彙の豊かさ"),
    "frequency_penalty_tips": MessageLookupByLibrary.simpleMessage(
      "値が大きいほど、語彙がより豊かで多様；値が低いほど、語彙がより素朴でシンプルになる",
    ),
    "github": MessageLookupByLibrary.simpleMessage("GitHub"),
    "language": MessageLookupByLibrary.simpleMessage("日本語"),
    "light": MessageLookupByLibrary.simpleMessage("ライトモード"),
    "max_tokens": MessageLookupByLibrary.simpleMessage("一回の応答制限"),
    "max_tokens_tips": MessageLookupByLibrary.simpleMessage(
      "一回のインタラクションで使用する最大トークン数",
    ),
    "max_topic_history": MessageLookupByLibrary.simpleMessage("最大対話履歴"),
    "max_topic_history_tips": MessageLookupByLibrary.simpleMessage(
      "これを有効にすると、指定された数を超えた場合、最も古いメッセージが自動的に切り捨てられます",
    ),
    "message": m0,
    "model_name": MessageLookupByLibrary.simpleMessage("モデル名"),
    "model_settings": MessageLookupByLibrary.simpleMessage("モデル設定"),
    "please_enter": MessageLookupByLibrary.simpleMessage("入力してください"),
    "pre_input": MessageLookupByLibrary.simpleMessage("プレ入力内容"),
    "pre_input_placeholder": MessageLookupByLibrary.simpleMessage(
      "プレ処理テンプレート/{/{text/}/}はリアルタイムの入力情報に置き換えられます",
    ),
    "pre_input_tips": MessageLookupByLibrary.simpleMessage(
      "ユーザーの最新のメッセージがこのテンプレートに埋め込まれます",
    ),
    "presence_penalty": MessageLookupByLibrary.simpleMessage("表現の多様性"),
    "presence_penalty_tips": MessageLookupByLibrary.simpleMessage(
      "値が大きいほど、異なる表現方法を好み、概念の重複を避ける；値が小さいほど、重複した概念や叙述を使用する傾向があり、表現がより一貫性を持つ",
    ),
    "providers": MessageLookupByLibrary.simpleMessage("プロバイダー"),
    "reasoning_effort": MessageLookupByLibrary.simpleMessage("推論の強度"),
    "reasoning_effort_tips": MessageLookupByLibrary.simpleMessage(
      "値が大きいほど、推論能力が高まるが、応答時間とトークン消費が増加する可能性がある",
    ),
    "role_settings": MessageLookupByLibrary.simpleMessage("役割設定"),
    "role_settings_placeholder": MessageLookupByLibrary.simpleMessage(
      "アシスタントの役割、専門分野、口調スタイルなどの特徴を詳しく説明してください。",
    ),
    "role_settings_tips": MessageLookupByLibrary.simpleMessage(
      "詳細な役割設定は、AIアシスタントがその職務と行動様式をよりよく理解するのに役立ちます",
    ),
    "search": MessageLookupByLibrary.simpleMessage("トピックを検索"),
    "settings": MessageLookupByLibrary.simpleMessage("設定"),
    "system": MessageLookupByLibrary.simpleMessage("システム"),
    "temperature": MessageLookupByLibrary.simpleMessage("創造性の活発度"),
    "temperature_tips": MessageLookupByLibrary.simpleMessage(
      "数値が大きいほど、回答はより創造的で想像力に富む；数値が小さいほど、回答はより厳密になる",
    ),
    "theme": MessageLookupByLibrary.simpleMessage("テーマ"),
    "title": MessageLookupByLibrary.simpleMessage("ようこそ"),
    "top_p": MessageLookupByLibrary.simpleMessage("思考の開放度"),
    "top_p_tips": MessageLookupByLibrary.simpleMessage(
      "どれだけの可能性を考慮するか。値が大きいほど、より多くの可能な回答を受け入れる；値が小さいほど、最も可能性の高い回答を選ぶ傾向がある。創造性の活発度と同時に変更することは推奨しない",
    ),
    "translation": MessageLookupByLibrary.simpleMessage("翻訳"),
  };
}
