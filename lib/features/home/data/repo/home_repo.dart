import 'package:bookapp/core/utils/errors/failures.dart';
import 'package:bookapp/features/home/data/models/new_arrivalls_model.dart/new_arrivals_model/new_arrivals_model.dart';

import 'package:dartz/dartz.dart';
import '../models/best_seller_model.dart/best_seller_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BestSellerModel>>> bestSellerBooks();

  Future<Either<Failure, List<NewArrivalsModel>>> newArrivalsBooks();
}
