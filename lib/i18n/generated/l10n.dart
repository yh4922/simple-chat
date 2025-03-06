// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `SimpleChat`
  String get appname {
    return Intl.message('SimpleChat', name: 'appname', desc: '', args: []);
  }

  /// `Chat`
  String get chat {
    return Intl.message('Chat', name: 'chat', desc: '', args: []);
  }

  /// `Dark`
  String get dark {
    return Intl.message('Dark', name: 'dark', desc: '', args: []);
  }

  /// `Demo`
  String get demo {
    return Intl.message('Demo', name: 'demo', desc: '', args: []);
  }

  /// `GitHub`
  String get github {
    return Intl.message('GitHub', name: 'github', desc: '', args: []);
  }

  /// `Close`
  String get close {
    return Intl.message('Close', name: 'close', desc: '', args: []);
  }

  /// `English`
  String get language {
    return Intl.message('English', name: 'language', desc: '', args: []);
  }

  /// `Light`
  String get light {
    return Intl.message('Light', name: 'light', desc: '', args: []);
  }

  /// `Hello, {name}!`
  String message(Object name) {
    return Intl.message(
      'Hello, $name!',
      name: 'message',
      desc: '',
      args: [name],
    );
  }

  /// `Providers`
  String get providers {
    return Intl.message('Providers', name: 'providers', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `System`
  String get system {
    return Intl.message('System', name: 'system', desc: '', args: []);
  }

  /// `Theme`
  String get theme {
    return Intl.message('Theme', name: 'theme', desc: '', args: []);
  }

  /// `Welcome`
  String get title {
    return Intl.message('Welcome', name: 'title', desc: '', args: []);
  }

  /// `Translation`
  String get translation {
    return Intl.message('Translation', name: 'translation', desc: '', args: []);
  }

  /// `Exit`
  String get exit {
    return Intl.message('Exit', name: 'exit', desc: '', args: []);
  }

  /// `Search Topics`
  String get search {
    return Intl.message('Search Topics', name: 'search', desc: '', args: []);
  }

  /// `Just Chatting`
  String get default_assistant {
    return Intl.message(
      'Just Chatting',
      name: 'default_assistant',
      desc: '',
      args: [],
    );
  }

  /// `Please enter`
  String get please_enter {
    return Intl.message(
      'Please enter',
      name: 'please_enter',
      desc: '',
      args: [],
    );
  }

  /// `Add AI Assistant`
  String get add_ai_assistant {
    return Intl.message(
      'Add AI Assistant',
      name: 'add_ai_assistant',
      desc: '',
      args: [],
    );
  }

  /// `Assistant Setup`
  String get assistant_setup {
    return Intl.message(
      'Assistant Setup',
      name: 'assistant_setup',
      desc: '',
      args: [],
    );
  }

  /// `Chat Settings`
  String get chat_settings {
    return Intl.message(
      'Chat Settings',
      name: 'chat_settings',
      desc: '',
      args: [],
    );
  }

  /// `Model Settings`
  String get model_settings {
    return Intl.message(
      'Model Settings',
      name: 'model_settings',
      desc: '',
      args: [],
    );
  }

  /// `Advanced Settings`
  String get advanced_settings {
    return Intl.message(
      'Advanced Settings',
      name: 'advanced_settings',
      desc: '',
      args: [],
    );
  }

  /// `Custom Assistant`
  String get custom_assistant {
    return Intl.message(
      'Custom Assistant',
      name: 'custom_assistant',
      desc: '',
      args: [],
    );
  }

  /// `Assistant Name`
  String get assistant_name {
    return Intl.message(
      'Assistant Name',
      name: 'assistant_name',
      desc: '',
      args: [],
    );
  }

  /// `Give your AI assistant a name`
  String get assistant_name_placeholder {
    return Intl.message(
      'Give your AI assistant a name',
      name: 'assistant_name_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Assistant Description`
  String get assistant_desc {
    return Intl.message(
      'Assistant Description',
      name: 'assistant_desc',
      desc: '',
      args: [],
    );
  }

  /// `Briefly describe the functions and features of this assistant`
  String get assistant_desc_placeholder {
    return Intl.message(
      'Briefly describe the functions and features of this assistant',
      name: 'assistant_desc_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Role Settings`
  String get role_settings {
    return Intl.message(
      'Role Settings',
      name: 'role_settings',
      desc: '',
      args: [],
    );
  }

  /// `Detail the assistant's role, area of expertise, tone, and style.`
  String get role_settings_placeholder {
    return Intl.message(
      'Detail the assistant\'s role, area of expertise, tone, and style.',
      name: 'role_settings_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `A detailed role setting can help the AI assistant better understand its responsibilities and behavior.`
  String get role_settings_tips {
    return Intl.message(
      'A detailed role setting can help the AI assistant better understand its responsibilities and behavior.',
      name: 'role_settings_tips',
      desc: '',
      args: [],
    );
  }

  /// `Pre-input Content`
  String get pre_input {
    return Intl.message(
      'Pre-input Content',
      name: 'pre_input',
      desc: '',
      args: [],
    );
  }

  /// `Pre-processing template/{/{text/}/} will be replaced with real-time input information`
  String get pre_input_placeholder {
    return Intl.message(
      'Pre-processing template/{/{text/}/} will be replaced with real-time input information',
      name: 'pre_input_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `The latest user message will fill this template`
  String get pre_input_tips {
    return Intl.message(
      'The latest user message will fill this template',
      name: 'pre_input_tips',
      desc: '',
      args: [],
    );
  }

  /// `Chat Style`
  String get chat_style {
    return Intl.message('Chat Style', name: 'chat_style', desc: '', args: []);
  }

  /// `Conversation Mode`
  String get conversation_mode {
    return Intl.message(
      'Conversation Mode',
      name: 'conversation_mode',
      desc: '',
      args: [],
    );
  }

  /// `Document Mode`
  String get document_mode {
    return Intl.message(
      'Document Mode',
      name: 'document_mode',
      desc: '',
      args: [],
    );
  }

  /// `Max Topic History`
  String get max_topic_history {
    return Intl.message(
      'Max Topic History',
      name: 'max_topic_history',
      desc: '',
      args: [],
    );
  }

  /// `If enabled, when this number is exceeded, the oldest messages will be automatically truncated.`
  String get max_topic_history_tips {
    return Intl.message(
      'If enabled, when this number is exceeded, the oldest messages will be automatically truncated.',
      name: 'max_topic_history_tips',
      desc: '',
      args: [],
    );
  }

  /// `Auto Create Topic`
  String get auto_reate_topic {
    return Intl.message(
      'Auto Create Topic',
      name: 'auto_reate_topic',
      desc: '',
      args: [],
    );
  }

  /// `If 'Max Topic History' is enabled, a new conversation will be automatically created when the history exceeds the limit.`
  String get auto_reate_topic_tips {
    return Intl.message(
      'If \'Max Topic History\' is enabled, a new conversation will be automatically created when the history exceeds the limit.',
      name: 'auto_reate_topic_tips',
      desc: '',
      args: [],
    );
  }

  /// `Auto Summary`
  String get auto_summary {
    return Intl.message(
      'Auto Summary',
      name: 'auto_summary',
      desc: '',
      args: [],
    );
  }

  /// `If 'Max Topic History' is enabled, when the history exceeds the limit, past messages will be automatically summarized into one.`
  String get auto_summary_tips {
    return Intl.message(
      'If \'Max Topic History\' is enabled, when the history exceeds the limit, past messages will be automatically summarized into one.',
      name: 'auto_summary_tips',
      desc: '',
      args: [],
    );
  }

  /// `Model Name`
  String get model_name {
    return Intl.message('Model Name', name: 'model_name', desc: '', args: []);
  }

  /// `Creativity Level`
  String get temperature {
    return Intl.message(
      'Creativity Level',
      name: 'temperature',
      desc: '',
      args: [],
    );
  }

  /// `A higher value indicates more creative and imaginative responses; a lower value indicates more rigorous answers.`
  String get temperature_tips {
    return Intl.message(
      'A higher value indicates more creative and imaginative responses; a lower value indicates more rigorous answers.',
      name: 'temperature_tips',
      desc: '',
      args: [],
    );
  }

  /// `Openness to Ideas`
  String get top_p {
    return Intl.message('Openness to Ideas', name: 'top_p', desc: '', args: []);
  }

  /// `Considers how many possibilities are taken into account; a higher value accepts more potential answers, while a lower value tends to choose the most likely response. It is not recommended to change this alongside creativity level.`
  String get top_p_tips {
    return Intl.message(
      'Considers how many possibilities are taken into account; a higher value accepts more potential answers, while a lower value tends to choose the most likely response. It is not recommended to change this alongside creativity level.',
      name: 'top_p_tips',
      desc: '',
      args: [],
    );
  }

  /// `Diversity of Expression`
  String get presence_penalty {
    return Intl.message(
      'Diversity of Expression',
      name: 'presence_penalty',
      desc: '',
      args: [],
    );
  }

  /// `A higher value leans towards different expressions, avoiding concept repetition; a lower value tends to use repeated concepts or narratives, resulting in more consistent expression.`
  String get presence_penalty_tips {
    return Intl.message(
      'A higher value leans towards different expressions, avoiding concept repetition; a lower value tends to use repeated concepts or narratives, resulting in more consistent expression.',
      name: 'presence_penalty_tips',
      desc: '',
      args: [],
    );
  }

  /// `Vocabulary Richness`
  String get frequency_penalty {
    return Intl.message(
      'Vocabulary Richness',
      name: 'frequency_penalty',
      desc: '',
      args: [],
    );
  }

  /// `A higher value indicates a richer and more varied vocabulary; a lower value indicates simpler and more straightforward language.`
  String get frequency_penalty_tips {
    return Intl.message(
      'A higher value indicates a richer and more varied vocabulary; a lower value indicates simpler and more straightforward language.',
      name: 'frequency_penalty_tips',
      desc: '',
      args: [],
    );
  }

  /// `Reasoning Intensity`
  String get reasoning_effort {
    return Intl.message(
      'Reasoning Intensity',
      name: 'reasoning_effort',
      desc: '',
      args: [],
    );
  }

  /// `A higher value indicates stronger reasoning ability, but may increase response time and token consumption.`
  String get reasoning_effort_tips {
    return Intl.message(
      'A higher value indicates stronger reasoning ability, but may increase response time and token consumption.',
      name: 'reasoning_effort_tips',
      desc: '',
      args: [],
    );
  }

  /// `Response Limit`
  String get max_tokens {
    return Intl.message(
      'Response Limit',
      name: 'max_tokens',
      desc: '',
      args: [],
    );
  }

  /// `The maximum number of tokens used in a single interaction.`
  String get max_tokens_tips {
    return Intl.message(
      'The maximum number of tokens used in a single interaction.',
      name: 'max_tokens_tips',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'ko'),
      Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
      Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
