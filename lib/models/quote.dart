class Quote {
  final String text;
  final String author;

  const Quote({required this.text, required this.author});

  Map<String, dynamic> toJson() {
    return {'text': text, 'author': author};
  }

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      text: json['text'] as String,
      author: json['author'] as String,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Quote && other.text == text && other.author == author;
  }

  @override
  int get hashCode => text.hashCode ^ author.hashCode;
}
