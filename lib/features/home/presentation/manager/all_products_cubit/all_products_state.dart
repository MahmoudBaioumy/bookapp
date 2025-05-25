import 'package:bookapp/features/home/data/models/all_prodtcus_model.dart';

abstract class AllProductsState {}

class AllProductsInitial extends AllProductsState {}

class AllProductsLoadingState extends AllProductsState {}

class AllProductsSuccessState extends AllProductsState {
  final AllProductsModel allProdtcusModel;

  AllProductsSuccessState(this.allProdtcusModel);
}

class AllProductsFailureState extends AllProductsState {
  final String errorMassage;

  AllProductsFailureState(this.errorMassage);
}

