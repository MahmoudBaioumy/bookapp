part of 'new_arrvals_cubit.dart';

@immutable
sealed class NewArrivalsState {}

final class NewArrivalsInitial extends NewArrivalsState {}

final class NewArrivalsLoading extends NewArrivalsState {}

// -------------------------- we use List to return the data because we only take this data and but it in the list  -------------------------- //
final class NewArrivalsSuccess extends NewArrivalsState {
  final NewArrivalsModel Books;

  NewArrivalsSuccess(this.Books);
}

final class NewArrivalsFailure extends NewArrivalsState {
  final String errMessage;

  NewArrivalsFailure(this.errMessage);
}
