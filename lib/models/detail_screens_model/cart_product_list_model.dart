/*
class CartProductListModel {
  int? id;
  int? customerId;
  String? cartGroupId;
  int? productId;
  String? productType;
  dynamic digitalProductType;
  dynamic color;
  Choices1? choices;
  Variations1? variations;
  String? variant;
  int? quantity;
  int? price;
  double? tax;
  double? discount;
  String? slug;
  String? name;
  String? thumbnail;
  int? sellerId;
  String? sellerIs;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? shopInfo;
  int? shippingCost;
  String? shippingType;
  ProductM? product;

  CartProductListModel({
    this.id,
    this.customerId,
    this.cartGroupId,
    this.productId,
    this.productType,
    this.digitalProductType,
    this.color,
    this.choices,
    this.variations,
    this.variant,
    this.quantity,
    this.price,
    this.tax,
    this.discount,
    this.slug,
    this.name,
    this.thumbnail,
    this.sellerId,
    this.sellerIs,
    this.createdAt,
    this.updatedAt,
    this.shopInfo,
    this.shippingCost,
    this.shippingType,
    this.product,
  });

  factory CartProductListModel.fromJson(Map<dynamic, dynamic> json) =>
      CartProductListModel(
        id: json["id"],
        customerId: json["customer_id"],
        cartGroupId: json["cart_group_id"],
        productId: json["product_id"],
        productType: json["product_type"],
        digitalProductType: json["digital_product_type"],
        color: json["color"],
        choices:
            json["choices"] == null ? null : Choices1.fromJson(json["choices"]),
        variations: json["variations"] == null
            ? null
            : Variations1.fromJson(json["variations"]),
        variant: json["variant"],
        quantity: json["quantity"],
        price: json["price"],
        tax: json["tax"]?.toDouble(),
        discount: json["discount"]?.toDouble(),
        slug: json["slug"],
        name: json["name"],
        thumbnail: json["thumbnail"],
        sellerId: json["seller_id"],
        sellerIs: json["seller_is"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        shopInfo: json["shop_info"],
        shippingCost: json["shipping_cost"],
        shippingType: json["shipping_type"],
        product:
            json["product"] == null ? null : ProductM.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "cart_group_id": cartGroupId,
        "product_id": productId,
        "product_type": productType,
        "digital_product_type": digitalProductType,
        "color": color,
        "choices": choices?.toJson(),
        "variations": variations?.toJson(),
        "variant": variant,
        "quantity": quantity,
        "price": price,
        "tax": tax,
        "discount": discount,
        "slug": slug,
        "name": name,
        "thumbnail": thumbnail,
        "seller_id": sellerId,
        "seller_is": sellerIs,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "shop_info": shopInfo,
        "shipping_cost": shippingCost,
        "shipping_type": shippingType,
        "product": product?.toJson(),
      };
}

class Choices1 {
  dynamic choice2;

  Choices1({
    this.choice2,
  });

  factory Choices1.fromJson(Map<String, dynamic> json) => Choices1(
        choice2: json["choice_2"],
      );

  Map<String, dynamic> toJson() => {
        "choice_2": choice2,
      };
}

class ProductM {
  int? id;
  String? name;
  String? slug;
  int? currentStock;
  int? minimumOrderQty;
  int? reviewsCount;
  int? totalCurrentStock;
  List<dynamic>? translations;
  List<dynamic>? reviews;

  ProductM({
    this.id,
    this.name,
    this.slug,
    this.currentStock,
    this.minimumOrderQty,
    this.reviewsCount,
    this.totalCurrentStock,
    this.translations,
    this.reviews,
  });

  factory ProductM.fromJson(Map<String, dynamic> json) => ProductM(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        currentStock: json["current_stock"],
        minimumOrderQty: json["minimum_order_qty"],
        reviewsCount: json["reviews_count"],
        totalCurrentStock: json["total_current_stock"],
        translations: json["translations"] == null
            ? []
            : List<dynamic>.from(json["translations"]!.map((x) => x)),
        reviews: json["reviews"] == null
            ? []
            : List<dynamic>.from(json["reviews"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "current_stock": currentStock,
        "minimum_order_qty": minimumOrderQty,
        "reviews_count": reviewsCount,
        "total_current_stock": totalCurrentStock,
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x)),
        "reviews":
            reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
      };
}

class Variations1 {
  dynamic size;

  Variations1({
    this.size,
  });

  factory Variations1.fromJson(Map<String, dynamic> json) => Variations1(
        size: json["size"],
      );

  Map<String, dynamic> toJson() => {
        "size": size,
      };
}
*/

class CartListModel {
  CartListModel({
    required this.id,
    required this.customerId,
    required this.cartGroupId,
    required this.productId,
    required this.productType,
    required this.digitalProductType,
    required this.color,
    required this.choices,
    required this.variations,
    required this.variant,
    required this.quantity,
    required this.price,
    required this.tax,
    required this.discount,
    required this.slug,
    required this.name,
    required this.thumbnail,
    required this.sellerId,
    required this.sellerIs,
    required this.createdAt,
    required this.updatedAt,
    required this.shopInfo,
    required this.shippingCost,
    required this.shippingType,
    required this.product,
  });

  final int? id;
  final int? customerId;
  final String? cartGroupId;
  final int? productId;
  final String? productType;
  final dynamic digitalProductType;
  final dynamic color;
  final dynamic? choices;
  final dynamic? variations;
  final String? variant;
  final int? quantity;
  final int? price;
  final double? tax;
  final double? discount;
  final String? slug;
  final String? name;
  final String? thumbnail;
  final int? sellerId;
  final String? sellerIs;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? shopInfo;
  final int? shippingCost;
  final String? shippingType;
  final Product? product;

  factory CartListModel.fromJson(Map<String, dynamic> json) {
    return CartListModel(
      id: json["id"],
      customerId: json["customer_id"],
      cartGroupId: json["cart_group_id"],
      productId: json["product_id"],
      productType: json["product_type"],
      digitalProductType: json["digital_product_type"],
      color: json["color"],
      choices: json["choices"],
      variations: json["variations"],
      variant: json["variant"],
      quantity: json["quantity"],
      price: json["price"],
      tax: json["tax"],
      discount: json["discount"],
      slug: json["slug"],
      name: json["name"],
      thumbnail: json["thumbnail"],
      sellerId: json["seller_id"],
      sellerIs: json["seller_is"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      shopInfo: json["shop_info"],
      shippingCost: json["shipping_cost"],
      shippingType: json["shipping_type"],
      product:
          json["product"] == null ? null : Product.fromJson(json["product"]),
    );
  }
}

class ChoicesClass {
  ChoicesClass({
    required this.choice2,
  });

  final dynamic choice2;

  factory ChoicesClass.fromJson(Map<String, dynamic> json) {
    return ChoicesClass(
      choice2: json["choice_2"],
    );
  }
}

class Product {
  Product({
    required this.id,
    required this.name,
    required this.slug,
    required this.currentStock,
    required this.minimumOrderQty,
    required this.reviewsCount,
    required this.totalCurrentStock,
    required this.translations,
    required this.reviews,
  });

  final int? id;
  final String? name;
  final String? slug;
  final int? currentStock;
  final int? minimumOrderQty;
  final int? reviewsCount;
  final int? totalCurrentStock;
  final List<dynamic> translations;
  final List<dynamic> reviews;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      name: json["name"],
      slug: json["slug"],
      currentStock: json["current_stock"],
      minimumOrderQty: json["minimum_order_qty"],
      reviewsCount: json["reviews_count"],
      totalCurrentStock: json["total_current_stock"],
      translations: json["translations"] == null
          ? []
          : List<dynamic>.from(json["translations"]!.map((x) => x)),
      reviews: json["reviews"] == null
          ? []
          : List<dynamic>.from(json["reviews"]!.map((x) => x)),
    );
  }
}

class VariationsClass {
  VariationsClass({
    required this.size,
  });

  final dynamic size;

  factory VariationsClass.fromJson(Map<String, dynamic> json) {
    return VariationsClass(
      size: json["size"],
    );
  }
}
