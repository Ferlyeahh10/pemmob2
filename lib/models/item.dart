class Item {
  String id;
  String title;
  String description;
  DateTime createdAt;
  String iconEmoji;

  Item({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    this.iconEmoji = '✨',
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
      'iconEmoji': iconEmoji,
    };
  }

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      createdAt: DateTime.parse(json['createdAt']),
      iconEmoji: json['iconEmoji'] ?? '✨',
    );
  }
}
