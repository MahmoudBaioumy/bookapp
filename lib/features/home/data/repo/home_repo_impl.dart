import 'package:bookapp/core/Services/dio_helper/api_service.dart';
import 'package:bookapp/core/Services/dio_helper/endpoint.dart';
import 'package:bookapp/core/utils/errors/failures.dart';
import 'package:bookapp/features/home/data/models/new_arrivalls_model.dart/new_arrivals_model/new_arrivals_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../models/best_seller_model.dart/best_seller_model.dart';
import 'home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  // -------------------------- Best seller -------------------------- //
  Future<Either<Failure, List<BestSellerModel>>> bestSellerBooks() async {
    try {
      var data = await apiService.getData(url: EndPoint.bestseller);
      List<BestSellerModel> books = [];
      for (var item in data['items']) {
        try {
          books.add(BestSellerModel.fromJson(item));
        } catch (e) {
          books.add(BestSellerModel.fromJson(item));
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
  Future<Either<Failure, List<NewArrivalsModel>>> newArrivalsBooks() {
    // TODO: implement newArrivalsBooks
    throw UnimplementedError();
  }
}
