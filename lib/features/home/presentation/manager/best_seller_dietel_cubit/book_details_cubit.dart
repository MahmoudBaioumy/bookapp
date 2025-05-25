import 'package:bloc/bloc.dart';
import 'package:bookapp/features/home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/utils/errors/failures.dart';
import '../../../data/models/books_details_model.dart';
import 'book_details_state.dart';

class BookDetailsCubit extends Cubit<BookDetailsState> {
  BookDetailsCubit(this.homeRepo) : super(BookDetailsInitial());

  final HomeRepo homeRepo;

  Future<void> fetchBookDetails(int id) async {
    emit(BookDetailsLoading());
    print("Fetching book details for ID: $id");
    Either<Failure, BookDetailsModel> result = await homeRepo
        .Booksdetails(id: id);
    result.fold(
      (failure) {
        emit(BookDetailsFailure(failure.errMessage));
        print("Failed to fetch book details: ${failure.errMessage}");
      },
      (details) {
        print("Fetched book details successfully: ${details.data}");
        if (details.data != null) {
          // ✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅ //
          print("✅ Emitting success state");
          if (details.data != null) {
            emit(BookDetailsSuccess(details.data!));
          } else {
            emit(BookDetailsFailure("لا توجد بيانات متاحة لهذا الكتاب"));
          }
          print("✅ Done emitting");
        } else {
          print("❌ No data found");
          emit(BookDetailsFailure("لا توجد بيانات متاحة لهذا الكتاب"));
        }
      },
    );
  }
}
