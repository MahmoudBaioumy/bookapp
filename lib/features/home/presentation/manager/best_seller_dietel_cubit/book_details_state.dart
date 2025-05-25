import 'package:bookapp/features/home/data/models/books_details_model.dart';

abstract class BookDetailsState {}

class BookDetailsInitial extends BookDetailsState {}

class BookDetailsLoading extends BookDetailsState {}

class BookDetailsSuccess extends BookDetailsState {
  final Products book;

  BookDetailsSuccess(this.book);
}

class BookDetailsFailure extends BookDetailsState {
  final String errorMessage;

  BookDetailsFailure(this.errorMessage);
}