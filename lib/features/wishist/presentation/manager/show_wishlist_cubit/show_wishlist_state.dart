import 'package:bookapp/features/wishist/data/model/add_to_wishlist_model.dart';
import 'package:bookapp/features/wishist/data/model/show_wishlist_model.dart';

abstract class ShowWishlistState {}

class showWishlistInitState extends ShowWishlistState {}

class showWishlistLoadingState extends ShowWishlistState {}

class showWishlistSuccessState extends ShowWishlistState {
  ShowWishlistModel wishlistbooks;

  showWishlistSuccessState(this.wishlistbooks);
}

class showWishlistFaluireState extends ShowWishlistState{
  final String errMassage;
  showWishlistFaluireState(this.errMassage);
}
class WishlistUpdateSuccessState extends ShowWishlistState {
  final List<ShowWishlist> updatedList;
  WishlistUpdateSuccessState(this.updatedList);
}
// -------------------------- add fav --------------------------

class addWishlistInitState extends ShowWishlistState {}

class addWishlistLoadingState extends ShowWishlistState {}

class addWishlistSuccessState extends ShowWishlistState {
  addedToWishlistModel addwishlistbooks;

  addWishlistSuccessState(this.addwishlistbooks);
}
class addWishlistFaluireState extends ShowWishlistState{
  final String errMassage;
  addWishlistFaluireState(this.errMassage);
}