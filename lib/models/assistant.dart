class Assistant {
  /// 助手ID
  final int id;

  /// 助手名称
  final String name;

  /// 助手描述
  final String description = "";

  /// 助手头像
  final String avatar = "";

  /// 助手创建时间
  final DateTime createdAt = DateTime.now();

  /// 角色设定
  final String profile = "";

  /// 聊天样式
  final String chatStyle = "chat"; // chat 聊天模式，doc 代码模式  code 代码模式

  /// 预输入
  final String preInput = "{{text}}";

  /// 自动创建话题
  /// 如果开启了autoCreateTopic 当超过 maxTopicHistory 对话历史后，会自动创建新的话题
  /// autoSummary 为true时，则不会自动创建话题
  final bool autoCreateTopic = true;

  /// 最大对话历史 如果开启了autoCreateTopic 当超过这个数量时，会自动创建新的话题
  final int maxTopicHistory = 10;

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
  final bool autoSummary = true;

  /// 模型提供商
  final String modelProvider = "openai";

  /// 模型名称
  final String model = "gpt-4o-mini";

  /// 模型温度
  ///
  /// 数值越大，回答越有创意和想象力；数值越小，回答越严谨
  final double temperature = 1.0;

  /// 思维开放度
  ///
  /// 考虑多少种可能性，值越大，接受更多可能的回答；值越小，倾向选择最可能的回答。不推荐和创意活跃度一起更改
  final double topP = 1.0;

  /// 表述发散度
  ///
  /// 值越大，越倾向不同的表达方式，避免概念重复；值越小，越倾向使用重复的概念或叙述，表达更具一致性
  final double presencePenalty = 0;

  /// 词汇丰富度
  ///
  /// 值越大，用词越丰富多样；值越低，用词更朴实简单
  final double frequencyPenalty = 0;

  /// 单次回复限制
  ///
  /// 单次交互所用的最大 Token 数
  final int maxTokens = 0;

  /// 推理强度
  ///
  /// 值越大，推理能力越强，但可能会增加响应时间和 Token 消耗
  /// - `low` 低
  /// - `medium` 中
  /// - `high` 高
  final String reasoningEffort = "medium";

  Assistant({required this.id, required this.name});
}
