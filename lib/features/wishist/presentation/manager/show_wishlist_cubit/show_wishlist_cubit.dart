import 'package:bookapp/features/wishist/data/model/show_wishlist_model.dart';
import 'package:bookapp/features/wishist/presentation/manager/show_wishlist_cubit/show_wishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/wishlist_repo.dart';

class ShowWishlistCubit extends Cubit<ShowWishlistState> {
  ShowWishlistCubit(this.wishlistRepo) : super(showWishlistInitState());

  final WishlistRepo wishlistRepo;
  List<ShowWishlist> wishlistItems = [];

  static ShowWishlistCubit get(context) => BlocProvider.of(context);
// -------------------------- ShowWishListBooks -------------------------- //
  Future<void> ShowWishlistBooks() async {
    emit(showWishlistLoadingState());
    var result = await wishlistRepo.ShowFavourite();
    result.fold(
          (failure) => emit(showWishlistFaluireState(failure.errMessage)),
          (favBooks) {
        wishlistItems = favBooks.data?.data ?? [];
        emit(showWishlistSuccessState(favBooks));
      },
    );
  }

  void toggleFavorite(ShowWishlist item) {
    if (wishlistItems.any((e) => e.id == item.id)) {
      wishlistItems.removeWhere((e) => e.id == item.id);
    } else {
      wishlistItems.add(item);
    }
    emit(WishlistUpdateSuccessState(wishlistItems));
  }
// -------------------------- remove from Fav -------------------------- //
  Future<void> removeItemFromWishlist(int id) async {
    var result = await wishlistRepo.RemoveFavourite(id);
    result.fold(
          (failure) {
       return (failure.errMessage);
      },
          (response) {
        // شيل العنصر من الـ List الحالية
        if (state is showWishlistSuccessState) {
          final currentState = state as showWishlistSuccessState;
          final updatedList = currentState.wishlistbooks.data!.data!
              .where((item) => item.id != id)
              .toList();

          final newModel = currentState.wishlistbooks;
          newModel.data!.data = updatedList;

          emit(showWishlistSuccessState(newModel));
        }
      }

    );
  }
  // -------------------------- added to wishlist -------------------------- //
  Future<void> addItemToWishlist(int id) async {
    emit(addWishlistLoadingState());
    var result = await wishlistRepo.AddtoFavourite(id); // تحتاج إلى تنفيذ الدالة في الريبو
    result.fold(
          (Failure) {
        emit(addWishlistFaluireState(Failure.errMessage));
      },
          (result) {
        emit(addWishlistSuccessState(result));
      },
    );
  }
}
