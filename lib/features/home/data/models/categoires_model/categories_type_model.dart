class CategoriesTypeModel {
  CategoriesTypeResponse? data;
  String? message;

  int? status;

  CategoriesTypeModel({this.data, this.message, this.status});

  CategoriesTypeModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new CategoriesTypeResponse.fromJson(json['data']) : null;
    message = json['message'];

    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;

    data['status'] = this.status;
    return data;
  }
}

class CategoriesTypeResponse {
  int? id;
  String? name;
  String? slug;
  List<Productscategories>? products;

  CategoriesTypeResponse({this.id, this.name, this.slug, this.products});

  CategoriesTypeResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    if (json['products'] != null) {
      products = <Productscategories>[];
      json['products'].forEach((v) {
        products!.add(new Productscategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Productscategories {
  int? id;
  String? name;
  String? description;
  int? stock;
  String? price;
  int? bestSeller;
  int? discount;
  double? priceAfterDiscount;
  String? image;

  Productscategories({
    this.id,
    this.name,
    this.description,
    this.stock,
    this.price,
    this.bestSeller,
    this.discount,
    this.priceAfterDiscount,
    this.image,
  });

  Productscategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    stock = json['stock'];
    price = json['price'];
    bestSeller = json['best_seller'];
    discount = json['discount'];
    priceAfterDiscount = json['price_after_discount'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['stock'] = this.stock;
    data['price'] = this.price;
    data['best_seller'] = this.bestSeller;
    data['discount'] = this.discount;
    data['price_after_discount'] = this.priceAfterDiscount;
    data['image'] = this.image;
    return data;
  }
}
