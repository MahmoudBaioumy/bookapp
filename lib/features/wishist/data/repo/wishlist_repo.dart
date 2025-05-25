import 'package:bookapp/core/extension/logger.dart';
import 'package:bookapp/core/utils/api_service/api_serves.dart';
import 'package:bookapp/core/utils/api_service/end_point.dart';
import 'package:bookapp/features/wishist/data/model/add_to_wishlist_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/errors/failures.dart';
import '../model/show_wishlist_model.dart';


// -------------------------- wishlistRepo -------------------------- //
abstract class WishlistRepo{
Future<Either<Failure,ShowWishlistModel>> ShowFavourite();
Future<Either<Failure,addedToWishlistModel>> AddtoFavourite(int id);
Future<Either<Failure,ShowWishlistModel>> RemoveFavourite(int id);

}



// -------------------------- wishlistRepoImple -------------------------- //
class wishlistRepoImple extends WishlistRepo{
  final ApiServes apiServes;

  wishlistRepoImple(this.apiServes);
  @override
  Future<Either<Failure, ShowWishlistModel>> ShowFavourite() async{
    try{
      var data = await apiServes.getData(EndPoint:EndPoint.wishlist);
      logger.i('the data of fav: $data');
      return right(ShowWishlistModel.fromJson(data));
    }catch(e,s){
      logger.e('Error s of favv is:$s');
      if(e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ShowWishlistModel>> RemoveFavourite(int id) async{
   try{
     var response=await apiServes.postData(EndPoint: EndPoint.removefromwishlist,
     data: {"product_id": id},
     );
     logger.i('response of remove fav :$response');
     return right(ShowWishlistModel.fromJson(response));
   }catch(e,s){
     logger.e('error of $e');
     logger.e('error of $s');
     if(e is DioException){
       return left(ServerFailure.fromDioError(e));
     }
     return left(ServerFailure(e.toString()));
   }
  }

  @override
  Future<Either<Failure, addedToWishlistModel>> AddtoFavourite(int id )async {
    try{
      var data=await  apiServes.postData(
          EndPoint: EndPoint.addtowishlist,
        data: {"product_id": id}

      );
      logger.i('Product added to wishlist: $data');
      return right(addedToWishlistModel.fromJson(data));
    }catch(e,s){
      logger.e('Error adding product to wishlist: $s');
      if(e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  
}