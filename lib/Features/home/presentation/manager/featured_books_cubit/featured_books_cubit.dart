import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repositories/home_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepository) : super(FeaturedBooksInitial());

  final HomeRepository homeRepository;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await homeRepository.fetchFeaturedBooks();
    result.fold(
      (failure) {
        emit(
          FeaturedBooksFailure(failure.errorMessage),
        );
      },
      (booksList) {
        emit(
          FeaturedBooksSuccess(booksList),
        );
      },
    );
  }
}
