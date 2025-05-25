import '../../../data/models/best_seller_model.dart';

abstract class BestSellerState {}

class BestSellerInitState extends BestSellerState {}

class BestSellerLoadingState extends BestSellerState {}

class BestSellerSuccessState extends BestSellerState {
  final BestSellerModel books;

  BestSellerSuccessState(this.books);
}

class BestSellerFailureState extends BestSellerState {
  final String errMassage;

  BestSellerFailureState(this.errMassage);
}
