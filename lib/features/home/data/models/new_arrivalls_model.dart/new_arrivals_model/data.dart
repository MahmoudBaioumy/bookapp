import 'package:equatable/equatable.dart';

import 'product.dart';

class Data extends Equatable {
  final List<Product>? products;

  const Data({this.products});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    products:
        (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'products': products?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [products];
}
