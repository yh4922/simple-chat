class Topic {
  /// 话题ID
  final int id;

  /// 助手ID
  final int assistantId;

  /// 话题名称
  final String name;

  /// 创建时间
  final DateTime createdAt = DateTime.now();

  Topic({required this.id, required this.assistantId, required this.name});
}
