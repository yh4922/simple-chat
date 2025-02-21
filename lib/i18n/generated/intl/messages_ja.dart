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

  static String m0(name) => "こんにちは、${name}さん!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "appname": MessageLookupByLibrary.simpleMessage("シンプルチャット"),
    "chat": MessageLookupByLibrary.simpleMessage("チャット"),
    "dark": MessageLookupByLibrary.simpleMessage("ダークモード"),
    "demo": MessageLookupByLibrary.simpleMessage("デモ"),
    "github": MessageLookupByLibrary.simpleMessage("GitHub"),
    "language": MessageLookupByLibrary.simpleMessage("日本語"),
    "light": MessageLookupByLibrary.simpleMessage("ライトモード"),
    "message": m0,
    "providers": MessageLookupByLibrary.simpleMessage("プロバイダー"),
    "settings": MessageLookupByLibrary.simpleMessage("設定"),
    "system": MessageLookupByLibrary.simpleMessage("システム"),
    "theme": MessageLookupByLibrary.simpleMessage("テーマ"),
    "title": MessageLookupByLibrary.simpleMessage("ようこそ"),
    "translation": MessageLookupByLibrary.simpleMessage("翻訳"),
  };
}
