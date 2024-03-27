import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repositories/home_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepository) : super(NewestBooksInitial());

  final HomeRepository homeRepository;

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await homeRepository.fetchNewestBooks();
    result.fold(
      (failure) {
        emit(
          NewestBooksFailure(failure.errorMessage),
        );
      },
      (booksList) {
        emit(
          NewestBooksSuccess(booksList),
        );
      },
    );
  }
}
