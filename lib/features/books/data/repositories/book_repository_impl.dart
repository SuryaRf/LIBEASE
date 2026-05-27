import 'package:dio/dio.dart';
import 'package:libease_app/features/books/data/models/book_model.dart';
import 'package:libease_app/features/books/domain/entities/book.dart';
import 'package:libease_app/features/books/domain/repositories/book_repository.dart';

class BookRepositoryImpl implements BookRepository {
  final Dio dio;

  BookRepositoryImpl(this.dio);

  @override
  Future<List<Book>> getBooks() async {
    try {
      final response = await dio.get('/api/v1/buku');
      final List data = response.data['data'];
      return data.map((json) => BookModel.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Book> getBookById(String id) async {
    try {
      final response = await dio.get('/api/v1/buku/$id');
      return BookModel.fromJson(response.data['data']);
    } catch (e) {
      rethrow;
    }
  }
}
