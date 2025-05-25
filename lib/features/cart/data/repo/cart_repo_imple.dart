import 'package:bookapp/core/utils/api_service/api_serves.dart';
import 'package:bookapp/core/utils/api_service/end_point.dart';
import 'package:bookapp/core/utils/errors/failures.dart';
import 'package:bookapp/features/cart/data/model/add_cart_model.dart';
import 'package:bookapp/features/cart/data/model/remove_cart_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../model/show_cart_model.dart';
import 'cart_repo.dart';

class CartRepoImple extends CartRepo {
  final ApiServes apiServes;

  CartRepoImple(this.apiServes);

  @override
  // -------------------------- ShowCart -------------------------- //
  Future<Either<Failure, ShowCartModel>> ShowCart() async {
    try {
      var response = await apiServes.getData(EndPoint: EndPoint.Showcart);
      return right(ShowCartModel.fromJson(response));
    } catch (e, s) {
      print(s);
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  } // -------------------------- Add Cart -------------------------- //

  @override
  Future<Either<Failure, AddCartModel>> AddCart({
    required int productId,
    required int quantity,
  }) async {
    try {
      final respons = await apiServes.postData(
        EndPoint: EndPoint.addCart,
        data: {
          'product_id': productId,
          'quantity': quantity
        },
      );
      return right(AddCartModel.fromJson(respons));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
// -------------------------- remove Cart -------------------------- //
  @override
  Future<Either<Failure, bool>> removeCart(
      {required int productId}) async {
    try {
      final data = await apiServes.postData(
          EndPoint: EndPoint.removeCart,
          data: {
            'cart_item_id': productId
          }
      );
      bool isSuccess =data['message']=='Product Removed From Cart';
      if(isSuccess){
        return right(isSuccess);
      }else{
        return left(ServerFailure(data['message']));
      }
    } catch (e,s) {
      print(e);
      print(s);
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}
