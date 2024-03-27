import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repositories/home_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'book_details_state.dart';

class BookDetailsCubit extends Cubit<BookDetailsState> {
  BookDetailsCubit(this.homeRepository) : super(BookDetailsInitial());

  final HomeRepository homeRepository;

  Future<void> fetchBookDetails({required String category}) async {
    emit(BookDetailsLoading());
    var result = await homeRepository.fetchBookDetails(category: category);
    result.fold(
      (failure) {
        emit(
          BookDetailsFailure(failure.errorMessage),
        );
      },
      (booksList) {
        emit(
          BookDetailsSuccess(booksList),
        );
      },
    );
  }
}
