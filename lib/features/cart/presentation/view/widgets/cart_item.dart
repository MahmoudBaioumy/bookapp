// import 'dart:developer';
//
// import 'package:bookapp/core/utils/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../data/model/checkout_model.dart';
//
//
// class CartItemWidget extends StatefulWidget {
//   const CartItemWidget({
//     super.key,
//     required this.model,
//   });
//
//   final CartItems? model;
//
//   @override
//   State<CartItemWidget> createState() => _CartItemWidgetState();
// }
//
// class _CartItemWidgetState extends State<CartItemWidget> {
//   int qty = 0;
//   bool snak = false;
//   void showSnackBarOnce(BuildContext context) {
//     if (!snak) {
//       setState(() {
//         snak = true;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           backgroundColor: ColorsManager.redcolor,
//           duration: const Duration(milliseconds: 300),
//           content:  Text(AppStrings.RemovedCart),
//         ),
//       );
//     }
//   }
//
//   @override
//   void initState() {
//     qty = widget.model?.itemQuantity ?? 0;
//     log('${widget.model?.itemId} ---$qty');
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<homeCubit, homeStates>(
//       listenWhen: (previous, current) =>
//       current is RemoveFromCartSuccess || current is UpdateCartSuccess,
//       listener: (context, state) {
//         if (state is RemoveFromCartSuccess) {
//           showSnackBarOnce(context);
//           context.read<homeCubit>().getShowCart();
//         } else if (state is UpdateCartSuccess) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               backgroundColor: Colors.green,
//               content: Text(
//                 AppStrings.UpdateCart,
//               ),
//             ),
//           );
//           context.read<homeCubit>().getShowCart();
//         }
//       },
//       child: Row(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(10),
//             child: Image.network(
//               widget.model?.itemProductImage ?? '',
//               height: 120,
//               width: 100,
//               fit: BoxFit.cover,
//             ),
//           ),
//           const Gap(15),
//           Expanded(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Expanded(
//                               child: Text(
//                                 widget.model?.itemProductName ?? '',
//                                 overflow: TextOverflow.ellipsis,
//                                 maxLines: 1,
//                                 style: getTitelstyle(color: AppColor.greycolor),
//                               )),
//                           //* Remove From Cart
//                           IconButton(
//                               onPressed: () {
//                                 context
//                                     .read<homeCubit>()
//                                     .removeFromCart(widget.model?.itemId ?? 0);
//                               },
//                               icon: Icon(
//                                 Icons.delete,
//                                 color: AppColor.redcolor,
//                               ))
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             widget.model!.itemProductPrice.toString(),
//                             style:
//                             getTitelstyle(color: AppColor.greycolor).copyWith(
//                               decoration: TextDecoration.lineThrough,
//                               decorationColor: AppColor.blackcolor,
//                             ),
//                           ),
//                           const Gap(5),
//                           Text(
//                             '${widget.model?.itemProductPriceAfterDiscount} EGP',
//                             style: getTitelstyle(color: AppColor.bluecolor),
//                           ),
//                           const Spacer(),
//                           Text(
//                             '-${widget.model?.itemProductDiscount}%',
//                             style: getTitelstyle(color: AppColor.redcolor),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   const Gap(10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       FloatingActionButton.small(
//                         elevation: 0,
//                         backgroundColor: AppColor.bluecolor,
//                         onPressed: () {
//                           if (qty > 1) {
//                             context
//                                 .read<homeCubit>()
//                                 .updateCart(widget.model?.itemId ?? 0, --qty);
//                           }
//                         },
//                         child: const Icon(Icons.remove),
//                       ),
//                       const Gap(10),
//                       Text(
//                         qty.toString(),
//                         style: getTitelstyle(),
//                       ),
//                       const Gap(10),
//                       FloatingActionButton.small(
//                         elevation: 0,
//                         onPressed: () {
//                           if (qty < widget.model!.itemProductStock!.toInt()) {
//                             context
//                                 .read<homeCubit>()
//                                 .updateCart(widget.model?.itemId ?? 0, ++qty);
//                             log(qty.toString());
//                           } else {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                 backgroundColor: AppColor.redcolor,
//                                 content: const Text('No more items in stock'),
//                               ),
//                             );
//                           }
//                         },
//                         backgroundColor: AppColor.bluecolor,
//                         child: const Icon(Icons.add),
//                       ),
//                     ],
//                   )
//                 ],
//               ))
//         ],
//       ),
//     );
//   }
// }