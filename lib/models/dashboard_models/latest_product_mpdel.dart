class LatestProductModel {
  int? totalSize;
  int? limit;
  int? offset;
  List<Products>? products;

  LatestProductModel({this.totalSize, this.limit, this.offset, this.products});

  LatestProductModel.fromJson(Map<String, dynamic> json) {
    totalSize = json['total_size'];
    limit = json['limit'];
    offset = json['offset'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['total_size'] = totalSize;
    data['limit'] = limit;
    data['offset'] = offset;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  String? addedBy;
  int? userId;
  String? name;
  String? slug;
  String? productType;
  List<CategoryIds>? categoryIds;
  int? brandId;
  String? unit;
  int? minQty;
  int? refundable;
  Null? digitalProductType;
  Null? digitalFileReady;
  List<String>? images;
  String? thumbnail;
  dynamic? featured;
  Null? flashDeal;
  String? videoProvider;
  Null? videoUrl;
  List<LPColors>? colors;
  int? variantProduct;
  List<int>? attributes;
  List<ChoiceOptions>? choiceOptions;
  List<Variation>? variation;
  int? published;
  int? unitPrice;
  num? purchasePrice;
  int? tax;
  String? taxType;
  int? discount;
  String? discountType;
  int? currentStock;
  int? minimumOrderQty;
  String? details;
  int? freeShipping;
  Null? attachment;
  String? createdAt;
  String? updatedAt;
  int? status;
  int? featuredStatus;
  String? metaTitle;
  String? metaDescription;
  String? metaImage;
  int? requestStatus;
  Null? deniedNote;
  int? shippingCost;
  int? multiplyQty;
  Null? tempShippingCost;
  Null? isShippingCostUpdated;
  String? code;
  int? reviewsCount;
  List<Null>? rating;
  List<Null>? translations;
  List<Null>? reviews;

  Products(
      {this.id,
      this.addedBy,
      this.userId,
      this.name,
      this.slug,
      this.productType,
      this.categoryIds,
      this.brandId,
      this.unit,
      this.minQty,
      this.refundable,
      this.digitalProductType,
      this.digitalFileReady,
      this.images,
      this.thumbnail,
      this.featured,
      this.flashDeal,
      this.videoProvider,
      this.videoUrl,
      this.colors,
      this.variantProduct,
      this.attributes,
      this.choiceOptions,
      this.variation,
      this.published,
      this.unitPrice,
      this.purchasePrice,
      this.tax,
      this.taxType,
      this.discount,
      this.discountType,
      this.currentStock,
      this.minimumOrderQty,
      this.details,
      this.freeShipping,
      this.attachment,
      this.createdAt,
      this.updatedAt,
      this.status,
      this.featuredStatus,
      this.metaTitle,
      this.metaDescription,
      this.metaImage,
      this.requestStatus,
      this.deniedNote,
      this.shippingCost,
      this.multiplyQty,
      this.tempShippingCost,
      this.isShippingCostUpdated,
      this.code,
      this.reviewsCount,
      this.rating,
      this.translations,
      this.reviews});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addedBy = json['added_by'];
    userId = json['user_id'];
    name = json['name'];
    slug = json['slug'];
    productType = json['product_type'];
    if (json['category_ids'] != null) {
      categoryIds = <CategoryIds>[];
      json['category_ids'].forEach((v) {
        categoryIds!.add(CategoryIds.fromJson(v));
      });
    }
    brandId = json['brand_id'];
    unit = json['unit'];
    minQty = json['min_qty'];
    refundable = json['refundable'];
    digitalProductType = json['digital_product_type'];
    digitalFileReady = json['digital_file_ready'];
    images = json['images'].cast<String>();
    thumbnail = json['thumbnail'];
    featured = json['featured'];
    flashDeal = json['flash_deal'];
    videoProvider = json['video_provider'];
    videoUrl = json['video_url'];
    if (json['colors'] != null) {
      colors = <LPColors>[];
      json['colors'].forEach((v) {
        colors!.add(LPColors.fromJson(v));
      });
    }
    variantProduct = json['variant_product'];
    attributes = json['attributes'].cast<int>();
    if (json['choice_options'] != null) {
      choiceOptions = <ChoiceOptions>[];
      json['choice_options'].forEach((v) {
        choiceOptions!.add(ChoiceOptions.fromJson(v));
      });
    }
    if (json['variation'] != null) {
      variation = <Variation>[];
      json['variation'].forEach((v) {
        variation!.add(Variation.fromJson(v));
      });
    }
    published = json['published'];
    unitPrice = json['unit_price'];
    purchasePrice = json['purchase_price'];
    tax = json['tax'];
    taxType = json['tax_type'];
    discount = json['discount'];
    discountType = json['discount_type'];
    currentStock = json['current_stock'];
    minimumOrderQty = json['minimum_order_qty'];
    details = json['details'];
    freeShipping = json['free_shipping'];
    attachment = json['attachment'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    featuredStatus = json['featured_status'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    metaImage = json['meta_image'];
    requestStatus = json['request_status'];
    deniedNote = json['denied_note'];
    shippingCost = json['shipping_cost'];
    multiplyQty = json['multiply_qty'];
    tempShippingCost = json['temp_shipping_cost'];
    isShippingCostUpdated = json['is_shipping_cost_updated'];
    code = json['code'];
    reviewsCount = json['reviews_count'];
    if (json["rating"] == null) {
      rating = null;
    }
    if (json["translations"] == null) {
      translations = null;
    }
    if (json["reviews"] == null) {
      reviews = null;
    }

    /*if (json['rating'] != null) {
      rating = <Null>[];
      json['rating'].forEach((v) {
        rating!.add(Null.fromJson(v));
      });
    }
    if (json['translations'] != null) {
      translations = <Null>[];
      json['translations'].forEach((v) {
        translations!.add(Null.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = <Null>[];
      json['reviews'].forEach((v) {
        reviews!.add(Null.fromJson(v));
      });
    }  */
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['added_by'] = addedBy;
    data['user_id'] = userId;
    data['name'] = name;
    data['slug'] = slug;
    data['product_type'] = productType;
    if (categoryIds != null) {
      data['category_ids'] = categoryIds!.map((v) => v.toJson()).toList();
    }
    data['brand_id'] = brandId;
    data['unit'] = unit;
    data['min_qty'] = minQty;
    data['refundable'] = refundable;
    data['digital_product_type'] = digitalProductType;
    data['digital_file_ready'] = digitalFileReady;
    data['images'] = images;
    data['thumbnail'] = thumbnail;
    data['featured'] = featured;
    data['flash_deal'] = flashDeal;
    data['video_provider'] = videoProvider;
    data['video_url'] = videoUrl;
    if (colors != null) {
      data['colors'] = colors!.map((v) => v.toJson()).toList();
    }
    data['variant_product'] = variantProduct;
    data['attributes'] = attributes;
    if (choiceOptions != null) {
      data['choice_options'] = choiceOptions!.map((v) => v.toJson()).toList();
    }
    if (variation != null) {
      data['variation'] = variation!.map((v) => v.toJson()).toList();
    }
    data['published'] = published;
    data['unit_price'] = unitPrice;
    data['purchase_price'] = purchasePrice;
    data['tax'] = tax;
    data['tax_type'] = taxType;
    data['discount'] = discount;
    data['discount_type'] = discountType;
    data['current_stock'] = currentStock;
    data['minimum_order_qty'] = minimumOrderQty;
    data['details'] = details;
    data['free_shipping'] = freeShipping;
    data['attachment'] = attachment;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['status'] = status;
    data['featured_status'] = featuredStatus;
    data['meta_title'] = metaTitle;
    data['meta_description'] = metaDescription;
    data['meta_image'] = metaImage;
    data['request_status'] = requestStatus;
    data['denied_note'] = deniedNote;
    data['shipping_cost'] = shippingCost;
    data['multiply_qty'] = multiplyQty;
    data['temp_shipping_cost'] = tempShippingCost;
    data['is_shipping_cost_updated'] = isShippingCostUpdated;
    data['code'] = code;
    data['reviews_count'] = reviewsCount;
    if (rating == null) {
      data["rating"] = null;
    }
    if (translations == null) {
      data["translations"] = null;
    }
    if (reviews == null) {
      data["reviews"] = null;
    }

    /* if (rating != null) {
      data['rating'] = rating!.map((v) => v.toJson()).toList();
    }
    if (translations != null) {
      data['translations'] = translations!.map((v) => v.toJson()).toList();
    }
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }*/
    return data;
  }
}

class CategoryIds {
  String? id;
  int? position;

  CategoryIds({this.id, this.position});

  CategoryIds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['position'] = position;
    return data;
  }
}

class LPColors {
  String? name;
  String? code;

  LPColors({this.name, this.code});

  LPColors.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['code'] = code;
    return data;
  }
}

class ChoiceOptions {
  String? name;
  String? title;
  List<String>? options;

  ChoiceOptions({this.name, this.title, this.options});

  ChoiceOptions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    title = json['title'];
    options = json['options'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['title'] = title;
    data['options'] = options;
    return data;
  }
}

class Variation {
  String? type;
  int? price;
  String? sku;
  int? qty;

  Variation({this.type, this.price, this.sku, this.qty});

  Variation.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    price = json['price'];
    sku = json['sku'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = type;
    data['price'] = price;
    data['sku'] = sku;
    data['qty'] = qty;
    return data;
  }
}
