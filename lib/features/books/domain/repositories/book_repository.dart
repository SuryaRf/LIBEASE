import 'package:libease_app/features/books/domain/entities/book.dart';

abstract class BookRepository {
  Future<List<Book>> getBooks();
  Future<Book> getBookById(String id);
}
