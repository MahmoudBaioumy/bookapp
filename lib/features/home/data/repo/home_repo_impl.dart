import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../../../../core/extension/logger.dart';
import '../../../../core/utils/api_service/api_serves.dart';
import '../../../../core/utils/api_service/end_point.dart';
import '../../../../core/utils/errors/failures.dart';
import '../models/all_prodtcus_model.dart';
import '../models/best_seller_model.dart';
import '../models/books_details_model.dart';
import '../models/categoires_model/all_categories_model.dart';
import '../models/categoires_model/categories_type_model.dart';
import '../models/new_arrivals_model.dart';
import 'home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiServes apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, BestSellerModel>> bestSellerBooks() async {
    try {
      logger.i("Fetching best seller books...");
      var data = await apiService.getData(EndPoint: EndPoint.bestseller);
      return right(BestSellerModel.fromJson(data));
    } catch (e, s) {
      logger.e("Error fetching all products", error: e, stackTrace: s);
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, BookDetailsModel>> Booksdetails({required int id}) async {
    try {
      logger.i("Fetching book details for ID: $id");
      var data = await apiService.getBooksById(id: id);
      logger.d("Book details response: $data");
      return right(BookDetailsModel.fromJson(data));
    } catch (e, s) {
      logger.e("Error fetching all products", error: e, stackTrace: s);
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, NewArrivalsModel>> newArrivalsBooks() async {
    try {
      logger.i("Fetching new arrivals...");
      var data = await apiService.getData(EndPoint: EndPoint.NewArrivals);
      return right(NewArrivalsModel.fromJson(data));
    } catch (e, s) {
      logger.e("Error fetching all products", error: e, stackTrace: s);
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AllCategoriesModel>> AllCategoriesBooks() async {
    try {
      logger.i("Fetching all categories...");
      var data = await apiService.getData(EndPoint: EndPoint.categories);
      return right(AllCategoriesModel.fromJson(data));
    } catch (e, s) {
      logger.e("Error fetching all products", error: e, stackTrace: s);
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CategoriesTypeModel>> CategoriesBookstype({required int id}) async {
    try {
      logger.i("Fetching category type for ID: $id");
      var data = await apiService.getCategoryById(id: id);
      return right(CategoriesTypeModel.fromJson(data));
    } catch (e, s) {
      logger.e("Error fetching all products", error: e, stackTrace: s);
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AllProductsModel>> getAllProducts(int page) async {
    int _page = page + 1;
    try {
      final endpoint = "${EndPoint.allProduct}?page=$_page";
      logger.i("Fetching all products - Page $_page");
      logger.d("Endpoint: $endpoint");
      var data = await apiService.getData(EndPoint: endpoint);
      Logger().i('All products response: $data');
      return right(AllProductsModel.fromJson(data));
    } catch (e, s) {
      logger.e("Error fetching all products", error: e, stackTrace: s);
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
