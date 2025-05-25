import 'package:bookapp/core/utils/errors/failures.dart';
import 'package:bookapp/features/home/data/models/categoires_model/all_categories_model.dart';
import 'package:dartz/dartz.dart';
import '../models/all_prodtcus_model.dart';
import '../models/books_details_model.dart';
import '../models/best_seller_model.dart';
import '../models/categoires_model/categories_type_model.dart';
import '../models/new_arrivals_model.dart';

abstract class HomeRepo {
  // -------------------------- All Products --------------------------//
  Future<Either<Failure, AllProductsModel>> getAllProducts(int page);
  // -------------------------- bestSellerBooks --------------------------
  Future<Either<Failure, BestSellerModel>> bestSellerBooks();

  Future<Either<Failure, NewArrivalsModel>> newArrivalsBooks();

  Future<Either<Failure, BookDetailsModel>> Booksdetails({required int id});
// -------------------------- categories -------------------------- //
  Future<Either<Failure, AllCategoriesModel>> AllCategoriesBooks();

  Future<Either<Failure, CategoriesTypeModel>> CategoriesBookstype({required int id});
  


}
