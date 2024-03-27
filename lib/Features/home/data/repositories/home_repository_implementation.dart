import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repositories/home_repository.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepositoryImplementation implements HomeRepository {
  final ApiService apiService;

  HomeRepositoryImplementation({required this.apiService});

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var date = await apiService.getService(
        endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=Love Story',
      );

      List<BookModel> booksList = [];

      for (var item in date['items']) {
          booksList.add(
            BookModel.fromJson(item),
          );
      }
      return right(booksList);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var date = await apiService.getService(
        endPoint: 'volumes?Filtering=free-ebooks&q=Money',
      );

      List<BookModel> booksList = [];

      for (var item in date['items']) {
        booksList.add(
          BookModel.fromJson(item),
        );
      }
      return right(booksList);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }
  
  @override
  Future<Either<Failure, List<BookModel>>> fetchBookDetails({required String category}) async {
    try {
      var date = await apiService.getService(
        endPoint: 'volumes?Filtering=free-ebooks&Sorting=relevance&q=Love Story',
      );

      List<BookModel> booksList = [];

      for (var item in date['items']) {
        booksList.add(
          BookModel.fromJson(item),
        );
      }
      return right(booksList);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }
}
