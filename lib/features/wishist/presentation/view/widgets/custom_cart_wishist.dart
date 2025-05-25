import 'package:flutter/material.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/value_manager.dart';
import '../../../../../core/widgets/custom_Image_List_view.dart';
import '../../../../../core/widgets/custom_column_text_list_view.dart';
import '../../../data/model/show_wishlist_model.dart';

class CustomCartWishist extends StatefulWidget {
  const CustomCartWishist({
    super.key,
    required this.heigth,
    required this.width,
    required this.favourite,
    this.onTapAddCart,
    this.onTapAddFav,
    required this.isFavorite,
  });

  final double heigth;
  final double width;
  final bool isFavorite;
  final ShowWishlist favourite;
  final Function()? onTapAddCart;
  final Function()? onTapAddFav;

  @override
  State<CustomCartWishist> createState() => _CustomCartWishistState();
}

class _CustomCartWishistState extends State<CustomCartWishist>
    with SingleTickerProviderStateMixin {
  late bool isFav;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    isFav = widget.isFavorite;

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
      lowerBound: 0.7,
      upperBound: 1.2,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleFavorite() {
    setState(() {
      isFav = !isFav;
    });
    _controller.forward().then((_) => _controller.reverse());
    widget.onTapAddFav?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.heigth * 0.22,
      width: widget.width * 0.99,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: [
          // صورة
          CustomImageListView(
            Image: widget.favourite.image ?? '',
            diss: widget.favourite.discount.toString(),
            heigth: widget.heigth,
            weidth: widget.width,
          ),
          SizedBox(width: widget.width * 0.03),
          // بيانات الكتاب
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomColumnTextListView(
                  heigth: widget.heigth,
                  weidth: widget.width,
                  bookname: widget.favourite.name ?? '',
                  booktype: widget.favourite.category ?? '',
                  booksaleafterdiss: widget.favourite.price ?? '',
                ),
              ],
            ),
          ),
          // أيقونات
          Column(
            children: [
              ScaleTransition(
                scale: _scaleAnimation,
                child: IconButton(
                  onPressed: _toggleFavorite,
                  icon: Icon(
                    isFav ? Icons.favorite : Icons.favorite_border,
                    color: isFav ? Colors.red : Colors.grey,
                  ),
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: widget.onTapAddCart,
                icon: Icon(Icons.add_shopping_cart_rounded),
                color: Colors.black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

