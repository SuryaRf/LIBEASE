import 'package:libease_app/features/books/domain/entities/book.dart';

class BookModel extends Book {
  BookModel({
    required super.id,
    required super.isbn,
    required super.title,
    super.author,
    super.category,
    super.description,
    super.imageUrl,
    required super.stock,
    super.publishYear,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id_buku'] ?? '',
      isbn: json['isbn'] ?? '',
      title: json['judul_buku'] ?? '',
      author: json['penulis_buku'],
      category: json['jenis_buku'],
      description: json['deskripsi_buku'],
      imageUrl: json['gambar_buku'],
      stock: json['stok_buku'] ?? 0,
      publishYear: json['tahun_terbit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_buku': id,
      'isbn': isbn,
      'judul_buku': title,
      'stok_buku': stock,
      // ... rest of fields
    };
  }
}
