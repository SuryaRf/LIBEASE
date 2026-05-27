class Book {
  final String id;
  final String isbn;
  final String title;
  final String? author;
  final String? category;
  final String? description;
  final String? imageUrl;
  final int stock;
  final String? publishYear;

  Book({
    required this.id,
    required this.isbn,
    required this.title,
    this.author,
    this.category,
    this.description,
    this.imageUrl,
    required this.stock,
    this.publishYear,
  });
}
