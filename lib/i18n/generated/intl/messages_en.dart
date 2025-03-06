// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(name) => "Hello, ${name}!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "add_ai_assistant": MessageLookupByLibrary.simpleMessage(
      "Add AI Assistant",
    ),
    "advanced_settings": MessageLookupByLibrary.simpleMessage(
      "Advanced Settings",
    ),
    "appname": MessageLookupByLibrary.simpleMessage("SimpleChat"),
    "assistant_desc": MessageLookupByLibrary.simpleMessage(
      "Assistant Description",
    ),
    "assistant_desc_placeholder": MessageLookupByLibrary.simpleMessage(
      "Briefly describe the functions and features of this assistant",
    ),
    "assistant_name": MessageLookupByLibrary.simpleMessage("Assistant Name"),
    "assistant_name_placeholder": MessageLookupByLibrary.simpleMessage(
      "Give your AI assistant a name",
    ),
    "assistant_setup": MessageLookupByLibrary.simpleMessage("Assistant Setup"),
    "auto_reate_topic": MessageLookupByLibrary.simpleMessage(
      "Auto Create Topic",
    ),
    "auto_reate_topic_tips": MessageLookupByLibrary.simpleMessage(
      "If \'Max Topic History\' is enabled, a new conversation will be automatically created when the history exceeds the limit.",
    ),
    "auto_summary": MessageLookupByLibrary.simpleMessage("Auto Summary"),
    "auto_summary_tips": MessageLookupByLibrary.simpleMessage(
      "If \'Max Topic History\' is enabled, when the history exceeds the limit, past messages will be automatically summarized into one.",
    ),
    "chat": MessageLookupByLibrary.simpleMessage("Chat"),
    "chat_settings": MessageLookupByLibrary.simpleMessage("Chat Settings"),
    "chat_style": MessageLookupByLibrary.simpleMessage("Chat Style"),
    "close": MessageLookupByLibrary.simpleMessage("Close"),
    "conversation_mode": MessageLookupByLibrary.simpleMessage(
      "Conversation Mode",
    ),
    "custom_assistant": MessageLookupByLibrary.simpleMessage(
      "Custom Assistant",
    ),
    "dark": MessageLookupByLibrary.simpleMessage("Dark"),
    "default_assistant": MessageLookupByLibrary.simpleMessage("Just Chatting"),
    "demo": MessageLookupByLibrary.simpleMessage("Demo"),
    "document_mode": MessageLookupByLibrary.simpleMessage("Document Mode"),
    "exit": MessageLookupByLibrary.simpleMessage("Exit"),
    "frequency_penalty": MessageLookupByLibrary.simpleMessage(
      "Vocabulary Richness",
    ),
    "frequency_penalty_tips": MessageLookupByLibrary.simpleMessage(
      "A higher value indicates a richer and more varied vocabulary; a lower value indicates simpler and more straightforward language.",
    ),
    "github": MessageLookupByLibrary.simpleMessage("GitHub"),
    "language": MessageLookupByLibrary.simpleMessage("English"),
    "light": MessageLookupByLibrary.simpleMessage("Light"),
    "max_tokens": MessageLookupByLibrary.simpleMessage("Response Limit"),
    "max_tokens_tips": MessageLookupByLibrary.simpleMessage(
      "The maximum number of tokens used in a single interaction.",
    ),
    "max_topic_history": MessageLookupByLibrary.simpleMessage(
      "Max Topic History",
    ),
    "max_topic_history_tips": MessageLookupByLibrary.simpleMessage(
      "If enabled, when this number is exceeded, the oldest messages will be automatically truncated.",
    ),
    "message": m0,
    "model_name": MessageLookupByLibrary.simpleMessage("Model Name"),
    "model_settings": MessageLookupByLibrary.simpleMessage("Model Settings"),
    "please_enter": MessageLookupByLibrary.simpleMessage("Please enter"),
    "pre_input": MessageLookupByLibrary.simpleMessage("Pre-input Content"),
    "pre_input_placeholder": MessageLookupByLibrary.simpleMessage(
      "Pre-processing template/{/{text/}/} will be replaced with real-time input information",
    ),
    "pre_input_tips": MessageLookupByLibrary.simpleMessage(
      "The latest user message will fill this template",
    ),
    "presence_penalty": MessageLookupByLibrary.simpleMessage(
      "Diversity of Expression",
    ),
    "presence_penalty_tips": MessageLookupByLibrary.simpleMessage(
      "A higher value leans towards different expressions, avoiding concept repetition; a lower value tends to use repeated concepts or narratives, resulting in more consistent expression.",
    ),
    "providers": MessageLookupByLibrary.simpleMessage("Providers"),
    "reasoning_effort": MessageLookupByLibrary.simpleMessage(
      "Reasoning Intensity",
    ),
    "reasoning_effort_tips": MessageLookupByLibrary.simpleMessage(
      "A higher value indicates stronger reasoning ability, but may increase response time and token consumption.",
    ),
    "role_settings": MessageLookupByLibrary.simpleMessage("Role Settings"),
    "role_settings_placeholder": MessageLookupByLibrary.simpleMessage(
      "Detail the assistant\'s role, area of expertise, tone, and style.",
    ),
    "role_settings_tips": MessageLookupByLibrary.simpleMessage(
      "A detailed role setting can help the AI assistant better understand its responsibilities and behavior.",
    ),
    "search": MessageLookupByLibrary.simpleMessage("Search Topics"),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "system": MessageLookupByLibrary.simpleMessage("System"),
    "temperature": MessageLookupByLibrary.simpleMessage("Creativity Level"),
    "temperature_tips": MessageLookupByLibrary.simpleMessage(
      "A higher value indicates more creative and imaginative responses; a lower value indicates more rigorous answers.",
    ),
    "theme": MessageLookupByLibrary.simpleMessage("Theme"),
    "title": MessageLookupByLibrary.simpleMessage("Welcome"),
    "top_p": MessageLookupByLibrary.simpleMessage("Openness to Ideas"),
    "top_p_tips": MessageLookupByLibrary.simpleMessage(
      "Considers how many possibilities are taken into account; a higher value accepts more potential answers, while a lower value tends to choose the most likely response. It is not recommended to change this alongside creativity level.",
    ),
    "translation": MessageLookupByLibrary.simpleMessage("Translation"),
  };
}
