import 'package:bookapp/features/cart/data/model/show_cart_model.dart';
import 'package:bookapp/features/cart/data/repo/cart_repo.dart';
import 'package:bookapp/features/cart/presentation/manager/cubit/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CartCubit extends Cubit<CartStates> {
  CartCubit(this.cartRepo) : super(ShowCartInitialState());
  final CartRepo cartRepo;

  static CartCubit get(context) => BlocProvider.of(context);

  ShowCartModel? showCartModel;
  Future<void> getShowCart() async {
    emit(ShowCartLoadingState());
    var result = await cartRepo.ShowCart();
    print(">> CartCubit - Result: $result");
    print(result);
    result.fold(
      (Failure) {
        emit(ShowCartFailureState(Failure.errMessage));
      },
      (Carts) {
        showCartModel = Carts;
        emit(ShowCartSuccessState(Carts));
      },
    );
  }

// -------------------------- add cart -------------------------- //
  Future<void> AddCart({required int productId, required int quantity}) async {
    emit(AddCartLoadingState());
    var result = await cartRepo.AddCart(
      productId: productId,
      quantity: quantity,
    );
    print(">> CartCubit - Result: $result");
    print(result);
    result.fold(
      (Failure) {
        emit(AddToCartFailure(Failure.errMessage));
      },
      (AddCarts) {
        emit(AddCartSuccessState(AddCarts));
      },
    );
  }

  // -------------------------- Remove cart -------------------------- //
  Future<void> removeCart({required int productId}) async {
    emit(RemoveCartLoadingState());

    var result = await cartRepo.removeCart(productId: productId);
    print(">> CartCubit - Result Remove: $result");

    result.fold(
          (failure) {
        emit(RemoveCartFailure(failure.errMessage));
        print("Failed to remove cart: ${failure.errMessage}");
      },
          (removeCartModel) async {
        // await getShowCart();
            showCartModel?.data?.cartItems?.removeWhere((item) => item.itemId == productId);
            emit(RemoveCartSuccessState());
      },
    );
  }


}
