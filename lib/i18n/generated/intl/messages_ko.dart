// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ko locale. All the
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
  String get localeName => 'ko';

  static String m0(name) => "안녕하세요, ${name}!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "appname": MessageLookupByLibrary.simpleMessage("SimpleChat"),
    "chat": MessageLookupByLibrary.simpleMessage("대화"),
    "dark": MessageLookupByLibrary.simpleMessage("어두운 색"),
    "default_assistant": MessageLookupByLibrary.simpleMessage("자유롭게 이야기하기"),
    "demo": MessageLookupByLibrary.simpleMessage("데모"),
    "exit": MessageLookupByLibrary.simpleMessage("종료"),
    "github": MessageLookupByLibrary.simpleMessage("GitHub"),
    "language": MessageLookupByLibrary.simpleMessage("한국어"),
    "light": MessageLookupByLibrary.simpleMessage("밝은 색"),
    "message": m0,
    "providers": MessageLookupByLibrary.simpleMessage("제공자"),
    "search": MessageLookupByLibrary.simpleMessage("주제 검색"),
    "settings": MessageLookupByLibrary.simpleMessage("설정"),
    "system": MessageLookupByLibrary.simpleMessage("시스템"),
    "theme": MessageLookupByLibrary.simpleMessage("테마"),
    "title": MessageLookupByLibrary.simpleMessage("환영합니다"),
    "translation": MessageLookupByLibrary.simpleMessage("번역"),
  };
}
