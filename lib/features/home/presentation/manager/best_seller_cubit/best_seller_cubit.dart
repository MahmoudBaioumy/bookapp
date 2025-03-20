import 'package:bookapp/core/utils/errors/failures.dart';
import 'package:bookapp/features/home/data/repo/home_repo.dart';
import 'package:bookapp/features/home/presentation/manager/best_seller_cubit/best_seller_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  BestSellerCubit(this.homeRepo) : super(BestSellerInitState());
  final HomeRepo homeRepo;

  Future<void> getBestSellerBooks() async {
    emit(BestSellerLoadingState());
    var result = await homeRepo.bestSellerBooks();
    print(result);
    result.fold(
      (Failure) {
        emit(BestSellerFailureState(Failure.errMessage));
      },
      (books) {
        emit(BestSellerSuccessState(books));
      },
    );
  }
}
