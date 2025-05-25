import 'package:bookapp/features/cart/data/model/add_cart_model.dart';
import 'package:bookapp/features/cart/data/model/remove_cart_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/utils/errors/failures.dart';
import '../model/checkout_model.dart';
import '../model/show_cart_model.dart';

abstract class CartRepo {
  Future<Either<Failure, ShowCartModel>> ShowCart();

  Future<Either<Failure, AddCartModel>> AddCart({
    required int productId,
    required int quantity,
  });

  Future<Either<Failure, bool>> removeCart({required int productId});
}
