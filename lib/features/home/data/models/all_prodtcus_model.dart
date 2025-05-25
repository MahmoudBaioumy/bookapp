class AllProductsModel {
  Data? data;
  String? message;
  List<dynamic>? error;
  int? status;

  AllProductsModel({this.data, this.message, this.error, this.status});

  AllProductsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    error = json['error'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() => {
    if (data != null) 'data': data!.toJson(),
    'message': message,
    'error': error,
    'status': status,
  };
}

class Data {
  List<AllProducts>? products;
  Meta? meta;
  Links? links;

  Data({this.products, this.meta, this.links});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = List<AllProducts>.from(
        json['products'].map((v) => AllProducts.fromJson(v)),
      );
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() => {
    if (products != null)
      'products': products!.map((v) => v.toJson()).toList(),
    if (meta != null) 'meta': meta!.toJson(),
    if (links != null) 'links': links!.toJson(),
  };
}

class AllProducts {
  int? id;
  String? name;
  String? description;
  String? price;
  int? discount;
  double? priceAfterDiscount;
  int? stock;
  int? bestSeller;
  String? image;
  String? category;

  AllProducts({
    this.id,
    this.name,
    this.description,
    this.price,
    this.discount,
    this.priceAfterDiscount,
    this.stock,
    this.bestSeller,
    this.image,
    this.category,
  });

  AllProducts.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        price = json['price'],
        discount = json['discount'],
        priceAfterDiscount = (json['price_after_discount'] as num?)?.toDouble(),
        stock = json['stock'],
        bestSeller = json['best_seller'],
        image = json['image'],
        category = json['category'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'price': price,
    'discount': discount,
    'price_after_discount': priceAfterDiscount,
    'stock': stock,
    'best_seller': bestSeller,
    'image': image,
    'category': category,
  };
}

class Meta {
  int? total;
  int? perPage;
  int? currentPage;
  int? lastPage;

  Meta({this.total, this.perPage, this.currentPage, this.lastPage});

  Meta.fromJson(Map<String, dynamic> json)
      : total = json['total'],
        perPage = json['per_page'],
        currentPage = json['current_page'],
        lastPage = json['last_page'];

  Map<String, dynamic> toJson() => {
    'total': total,
    'per_page': perPage,
    'current_page': currentPage,
    'last_page': lastPage,
  };
}

class Links {
  String? first;
  String? last;
  String? prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json)
      : first = json['first'],
        last = json['last'],
        prev = json['prev'],
        next = json['next'];

  Map<String, dynamic> toJson() => {
    'first': first,
    'last': last,
    'prev': prev,
    'next': next,
  };
}
