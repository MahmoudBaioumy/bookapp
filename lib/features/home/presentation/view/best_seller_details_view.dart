import 'package:bookapp/core/extension/translate.dart';
import 'package:bookapp/core/utils/colors.dart';
import 'package:bookapp/core/utils/lang/string_language_manager.dart';
import 'package:bookapp/core/utils/serves_locator.dart';
import 'package:bookapp/core/utils/value_manager.dart';
import 'package:bookapp/features/home/data/repo/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cart/data/repo/cart_repo_imple.dart';
import '../../../cart/presentation/manager/cubit/cart_cubit.dart';
import '../../data/repo/home_repo_impl.dart';
import '../manager/best_seller_dietel_cubit/book_details_cubit.dart';
import '../manager/best_seller_dietel_cubit/book_details_state.dart';
import 'widgets/columdetailsbody.dart';

class BestSellerDetilsView extends StatelessWidget {
  const BestSellerDetilsView({super.key, this.id});

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
                      var currentid = book.id;
                      if (currentid != null && currentid != 0) {
                        context.read<CartCubit>().AddCart(
                          productId: currentid,
                          quantity: 1,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(
                            AppStringsLanguage.addedToCart.trans(),
                          ),
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
