class Quote {
  final int id;
  final String text;
  final String bookName;
  final String? authorName;
  final String? addedBy;

  Quote({
    required this.id,
    required this.text,
    required this.bookName,
    this.authorName,
    this.addedBy,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json['id'],
      text: json['text'],
      bookName: json['book_name'],
      authorName: json['author_name'],
      addedBy: json['added_by'],
    );
  }
}
