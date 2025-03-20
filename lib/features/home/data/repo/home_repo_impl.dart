import 'package:bookapp/core/utils/api_service/end_point.dart';
import 'package:bookapp/core/utils/errors/failures.dart';
import 'package:bookapp/features/home/data/models/new_arrivalls_model.dart/new_arrivals_model/new_arrivals_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/api_service/api_serves.dart';
import '../models/best_seller_model.dart/best_seller_model.dart';
import 'home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiServes apiService;

  HomeRepoImpl(this.apiService);

  @override
  // -------------------------- Best seller -------------------------- //
  // Future<Either<Failure, List<BestSellerModel>>> bestSellerBooks() async {
  //   try {
  //     var data = await apiService.getData(EndPoint: EndPoint.bestseller);
  //     print("Raw Data: $data");
  //
  //     if (data == null || data['data'] == null ) {
  //       return left(ServerFailure("Invalid data format: products is missing or not a list"));
  //     }
  //     if (data['data'] is! Map || data['data']?['products'] is! List) {
  //       return left(ServerFailure("Invalid data format: 'products' is missing or not a list"));
  //     }
  //     List<dynamic> productsList = data['data']['products'];
  //     List<BestSellerModel> books = [];
  //     for (var products in productsList) {
  //       try {
  //         books.add(BestSellerModel.fromJson(products));
  //       } catch (e) {
  //         print("Error parsing product: $e");
  //       }
  //     }
  //     return right(books);
  //   } catch (e) {
  //     if (e is DioException) {
  //       return left(ServerFailure.fromDioError(e));
  //     }
  //     return left(ServerFailure(e.toString()));
  //   }
  // }
  Future<Either<Failure, List<BestSellerModel>>> bestSellerBooks() async {
    try {
      var data = await apiService.getData(EndPoint: EndPoint.bestseller);
      print("Raw API Response: $data");

      // التأكد إن الـ response مش null
      if (data == null) {
        return left(ServerFailure("API response is null"));
      }

      // التأكد من وجود `data` في الاستجابة
      if (!data.containsKey('data') || data['data'] == null) {
        return left(ServerFailure("Invalid API response: Missing 'data' key"));
      }

      // التأكد من وجود `products` وإنها قائمة
      if (!data['data'].containsKey('products') || data['data']['products'] is! List) {
        return left(ServerFailure("Invalid API response: 'products' key is missing or not a list"));
      }

      List<dynamic> productsList = data['data']['products'];

      // التأكد إن `productsList` مش فاضية
      if (productsList.isEmpty) {
        return left(ServerFailure("No products found"));
      }

      List<BestSellerModel> books = [];
      for (var product in productsList) {
        try {
          books.add(BestSellerModel.fromJson(product));
        } catch (e) {
          print("Error parsing product: $e");
        }
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }


  // -------------------------- newArrivalsBooks --------------------------
  @override
  Future<Either<Failure, List<NewArrivalsModel>>> newArrivalsBooks() async {
    try {
      var data = await apiService.getData(EndPoint: EndPoint.NewArrivals);
      print('***************************************');
      print(data['products']);
      List<NewArrivalsModel> books = [];
      if(data['products'] != null) {
        for (var products in data['products']) {
          try {
            books.add(NewArrivalsModel.fromJson(products));
          } catch (e) {
            books.add(NewArrivalsModel.fromJson(products));
          }
        }
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        // -------------------------- check about the error type if it sever error or some another error -------------------------- //
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
