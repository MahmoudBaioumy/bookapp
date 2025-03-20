import 'package:bloc/bloc.dart';
import 'package:bookapp/features/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

import '../../../data/models/new_arrivalls_model.dart/new_arrivals_model/new_arrivals_model.dart';

part 'new_arrvals_state.dart';

class NewArrvalsCubit extends Cubit<NewArrivalsState> {
  NewArrvalsCubit(this.homeRepo) : super(NewArrivalsInitial());

  final HomeRepo homeRepo;

  Future<void> getNewArrivalsBooks() async {
    emit(NewArrivalsLoading());
    var result = await homeRepo.newArrivalsBooks();
    result.fold(
      (failure) {
        emit(NewArrivalsFailure(failure.errMessage));
      },
      (books) {
        emit(NewArrivalsSuccess(books));
      },
    );
  }
}
