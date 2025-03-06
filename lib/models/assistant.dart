import 'package:simple_chat/utils/store.dart';

class Assistant {
  /// 助手ID
  late int id;

  /// 助手名称
  late String name;

  /// 助手描述
  String description = "";

  /// 助手头像
  String avatar = "🤖";

  /// 助手创建时间
  DateTime createdAt = DateTime.now();

  /// 角色设定
  String profile = "";

  /// 聊天样式
  String chatStyle = "chat"; // chat聊天模式，doc代码模式  code代码模式

  /// 预输入
  String preInput = "{{text}}";

  /// 自动创建话题
  /// 如果开启了autoCreateTopic 当超过 maxTopicHistory 对话历史后，会自动创建新的话题
  /// autoSummary 为true时，则不会自动创建话题
  bool autoCreateTopic = true;

  /// 最大对话历史 如果开启了autoCreateTopic 当超过这个数量时，会自动创建新的话题
  int maxTopicHistory = 10;

  /// 自动总结  超过 maxTopicHistory 对话历史后，则会调用模型对历史消息总结融合为一条消息 尽量保持上下文
  /// ```json
  ///{
  ///   "role": "system",
  ///   "content": "<chat_history_summary>
  ///                <docstring>描述</docstring>
  ///                <summary>摘要内容</summary>
  ///              </chat_history_summary>
  ///    "
  /// }
  /// ```
  bool autoSummary = true;

  /// 模型提供商
  String modelProvider = "openai";

  /// 模型名称
  String model = "gpt-4o-mini";

  /// 模型温度
  ///
  /// 数值越大，回答越有创意和想象力；数值越小，回答越严谨
  double temperature = 1.0;

  /// 思维开放度
  ///
  /// 考虑多少种可能性，值越大，接受更多可能的回答；值越小，倾向选择最可能的回答。不推荐和创意活跃度一起更改
  double topP = 1.0;

  /// 表述发散度
  ///
  /// 值越大，越倾向不同的表达方式，避免概念重复；值越小，越倾向使用重复的概念或叙述，表达更具一致性
  double presencePenalty = 0;

  /// 词汇丰富度
  ///
  /// 值越大，用词越丰富多样；值越低，用词更朴实简单
  double frequencyPenalty = 0;

  /// 单次回复限制
  ///
  /// 单次交互所用的最大 Token 数
  int maxTokens = 0;

  /// 推理强度
  ///
  /// 值越大，推理能力越强，但可能会增加响应时间和 Token 消耗
  /// - `low` 低
  /// - `medium` 中
  /// - `high` 高
  String reasoningEffort = "medium";

  /// 初始化
  Assistant({required this.id, required this.name});

  /// 从 JSON 对象解析到当前对象
  Assistant.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    avatar = json["avatar"];
    createdAt = json["createdAt"] != null ? DateTime.parse(json["createdAt"]) : DateTime.now();
    profile = json["profile"] ?? "";
    chatStyle = json["chatStyle"] ?? "";
    preInput = json["preInput"] ?? "";
    autoCreateTopic = json["autoCreateTopic"] ?? true;
    maxTopicHistory = json["maxTopicHistory"] ?? 10;
    autoSummary = json["autoSummary"] ?? true;
    modelProvider = json["modelProvider"] ?? "openai";
    model = json["model"] ?? "gpt-4o-mini";
    temperature = json["temperature"] ?? 1.0;
    topP = json["topP"] ?? 1.0;
    presencePenalty = json["presencePenalty"] ?? 0;
    frequencyPenalty = json["frequencyPenalty"] ?? 0;
    maxTokens = json["maxTokens"] ?? 0;
    reasoningEffort = json["reasoningEffort"] ?? "medium";
  }

  /// 将当前对象转换为 JSON 对象
  Map<String, dynamic> toJSON() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "avatar": avatar,
      "createdAt": createdAt,
      "profile": profile,
      "chatStyle": chatStyle,
      "preInput": preInput,
      "autoCreateTopic": autoCreateTopic,
      "maxTopicHistory": maxTopicHistory,
      "autoSummary": autoSummary,
      "modelProvider": modelProvider,
      "model": model,
      "temperature": temperature,
      "topP": topP,
      "presencePenalty": presencePenalty,
      "frequencyPenalty": frequencyPenalty,
      "maxTokens": maxTokens,
      "reasoningEffort": reasoningEffort,
    };
  }

  /// 获取随便聊聊
  static Assistant defaultAssistant() {
    // 从缓存获取默认助手配置
    Map<String, dynamic>? defaultJSON = Store.getJSON('default_assistant_conf');
    defaultJSON ??= {"id": 0, "name": "", "description": "", "avatar": ""};

    // 创建默认助手
    return Assistant.fromJson(defaultJSON);
  }
}
