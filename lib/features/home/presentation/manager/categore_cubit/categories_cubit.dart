import 'package:bloc/bloc.dart';
import 'package:bookapp/features/home/data/repo/home_repo.dart';
import 'package:bookapp/features/home/presentation/manager/categore_cubit/categories_state.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/utils/errors/failures.dart';
import '../../../data/models/categoires_model/categories_type_model.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.homeRepo) : super(CategoriesInitial());

  final HomeRepo homeRepo;
 late CategoriesTypeModel getCategoryModel ;
  Future<void> getAllCategories() async {
    emit(CategoriesLoading());
    var result = await homeRepo.AllCategoriesBooks();
    result.fold(
      (failure) {
        emit(CategoriesFailure(failure.errMessage));
      },
      (books) {
        emit(CategoriesSuccess(books));
      },
    );
  }


  Future<void> fetchBookCategory(int id) async {
    emit(CategorieTypeLoading());
    print("Fetching book details for ID: $id");
    Either<Failure, CategoriesTypeModel>
    result = await homeRepo.CategoriesBookstype(id: id);
    result.fold(
          (failure) {
        emit(categorieTypeFailure(failure.errMessage));
        print("Failed to fetch book details: ${failure.errMessage}");
      },
          (details) {
        print("Fetched book details successfully: ${details.data}");
        if (details.data != null) {
          // ✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅ //
          print("✅ Emitting success state");
          getCategoryModel = details;
          if (details.data != null) {
            emit(CategoiresTypeSuccess(getCategoryModel));
          } else {
            emit(categorieTypeFailure("لا توجد بيانات متاحة لهذا الكتاب"));
          }
          print("✅ Done emitting");
        } else {
          print("❌ No data found");
          emit(categorieTypeFailure("لا توجد بيانات متاحة لهذا الكتاب"));
        }
      },
    );
  }

}
