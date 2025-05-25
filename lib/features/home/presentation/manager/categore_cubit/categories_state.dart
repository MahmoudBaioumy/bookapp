import 'package:bookapp/features/home/data/models/categoires_model/all_categories_model.dart';

import '../../../data/models/categoires_model/categories_type_model.dart';

abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesSuccess extends CategoriesState {
  final AllCategoriesModel books;

  CategoriesSuccess(this.books);
}

class CategoriesFailure extends CategoriesState {
  final String errmassage;

  CategoriesFailure(this.errmassage);
}
// -------------------------- CategorieType -------------------------- //
class CategorieTypeInitial extends CategoriesState {}

class CategorieTypeLoading extends CategoriesState {}

class CategoiresTypeSuccess extends CategoriesState {
  final CategoriesTypeModel bookList;

  CategoiresTypeSuccess(this.bookList);
}

class categorieTypeFailure extends CategoriesState {
  final String errmassage;

  categorieTypeFailure(this.errmassage);
}
// -------------------------- category details -------------------------- //
class CategoryDetailsInitial extends CategoriesState {}

class CategoryDetailsLoading extends CategoriesState {}

class CategoryDetailsSuccess extends CategoriesState {
  final CategoriesTypeResponse bookList;

  CategoryDetailsSuccess(this.bookList);
}

class CategoryDetailsFailure extends CategoriesState {
  final String errmassage;

  CategoryDetailsFailure(this.errmassage);
}
