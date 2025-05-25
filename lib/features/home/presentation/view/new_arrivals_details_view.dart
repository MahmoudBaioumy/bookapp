import 'package:bookapp/core/extension/translate.dart';
import 'package:bookapp/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:bookapp/features/home/presentation/view/widgets/columdetailsbody.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/lang/string_language_manager.dart';
import '../../../../core/utils/serves_locator.dart';
import '../../../../core/utils/value_manager.dart';
import '../../../cart/data/repo/cart_repo_imple.dart';
import '../../data/repo/home_repo_impl.dart';
import '../manager/best_seller_dietel_cubit/book_details_cubit.dart';
import '../manager/best_seller_dietel_cubit/book_details_state.dart';

class NewArrivalsDetailsView extends StatelessWidget {
  const NewArrivalsDetailsView({super.key, this.id});

  @override
  final int? id;

  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  BookDetailsCubit(getit.get<HomeRepoImpl>())
                    ..fetchBookDetails(id ?? 0),
        ),
        BlocProvider(
          create: (context) => CartCubit(getit.get<CartRepoImple>()),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppSize.s3),
            child: BlocBuilder<BookDetailsCubit, BookDetailsState>(
              builder: (context, state) {
                if (state is BookDetailsLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.bluecolor,
                    ),
                  );
                } else if (state is BookDetailsSuccess) {
                  final book = state.book;
                  return ColumDetailsBody(
                    iamge: book.image ?? '',
                    titel: book.name ?? '',
                    type: book.category ?? '',
                    pricebeforeDiss: book.price ?? '',
                    priceAfterDiss: book.priceAfterDiscount.toString() ?? '',
                    diescription: book.description ?? '',
                    AddCart: () {
                      var carrantid = book.id;
                      if (carrantid != null && carrantid != 0) {
                        context.read<CartCubit>().AddCart(
                          productId: carrantid,
                          quantity: 1,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                AppStringsLanguage.addedToCart.trans()),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    },
                  );
                } else if (state is BookDetailsFailure) {
                  return Center(child: Text(state.errorMessage));
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
