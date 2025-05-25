import 'package:bookapp/features/cart/data/model/add_cart_model.dart';
import 'package:bookapp/features/cart/data/model/show_cart_model.dart';

import '../../../data/model/remove_cart_model.dart';

abstract class CartStates {}

class CartInitialStates extends CartStates {}

class ShowCartInitialState extends CartStates {}

class ShowCartLoadingState extends CartStates {}

class ShowCartSuccessState extends CartStates {
  final ShowCartModel Carts;

  ShowCartSuccessState(this.Carts);
}

class ShowCartFailureState extends CartStates {
  final String errMassage;

  ShowCartFailureState(this.errMassage);
}

// -------------------------- Add Cart -------------------------- //
class AddCartInitialState extends CartStates {}

class AddCartLoadingState extends CartStates {}

class AddCartSuccessState extends CartStates {
  final AddCartModel AddCarts;

  AddCartSuccessState(this.AddCarts);
}

class AddToCartFailure extends CartStates {
  final String errMassage;

  AddToCartFailure(this.errMassage);
}
// -------------------------- Remove Cart -------------------------- //

class RemoveCartInitialState extends CartStates {}

class RemoveCartLoadingState extends CartStates {}

class RemoveCartSuccessState extends CartStates {}

class RemoveCartFailure extends CartStates {
  final String errMassage;

  RemoveCartFailure(this.errMassage);
}

// -------------------------- checkout -------------------------- //
class CheckoutInitialState extends CartStates {}

class CheckoutLoadingState extends CartStates {}

class CheckoutSuccessState extends CartStates {}

class CheckoutFailureState extends CartStates {
  final String errMassage;

  CheckoutFailureState(this.errMassage);
}
