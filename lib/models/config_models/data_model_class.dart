/*class StaticURLModel {
  String? contact_us;
  String? brands;
  String? categories;
  String? customer_account;

  StaticURLModel(
      {this.contact_us, this.brands, this.categories, this.customer_account});

  factory StaticURLModel.fromJson(Map<String, dynamic> json) {
    return StaticURLModel(
      contact_us: json["contact_us"],
      brands: json["brands"],
      categories: json["categories"],
      customer_account: json["customer_account"],
    );
  }
}*/

class ConfigDataModel {
  String? brandSetting;
  String? digitalProductSetting;
  int? systemDefaultCurrency;
  bool? digitalPayment;
  bool? cashOnDelivery;
  String? sellerRegistration;
  BaseUrls? baseUrls;
  StaticUrls? staticUrls;
  String? aboutUs;
  String? privacyPolicy;
  List<dynamic>? faq;
  String? termsConditions;
  List<CurrencyList>? currencyList;
  String? currencySymbolPosition;
  String? businessMode;
  bool? maintenanceMode;
  List<Language>? language;
  List<MColors>? colors;
  List<String>? unit;
  String? shippingMethod;
  bool? emailVerification;
  bool? phoneVerification;
  String? countryCode;
  List<SocialLogin>? socialLogin;
  String? currencyModel;
  String? forgotPasswordVerification;
  Announcement? announcement;
  String? pixelAnalytics;
  String? softwareVersion;
  int? decimalPointSettings;
  String? inhouseSelectedShippingType;
  int? billingInputByCustomer;
  int? minimumOrderLimit;
  int? walletStatus;
  int? loyaltyPointStatus;
  int? loyaltyPointExchangeRate;
  int? loyaltyPointMinimumPoint;

  ConfigDataModel(
      {this.brandSetting,
      this.digitalProductSetting,
      this.systemDefaultCurrency,
      this.digitalPayment,
      this.cashOnDelivery,
      this.sellerRegistration,
      this.baseUrls,
      this.staticUrls,
      this.aboutUs,
      this.privacyPolicy,
      this.faq,
      this.termsConditions,
      this.currencyList,
      this.currencySymbolPosition,
      this.businessMode,
      this.maintenanceMode,
      this.language,
      this.colors,
      this.unit,
      this.shippingMethod,
      this.emailVerification,
      this.phoneVerification,
      this.countryCode,
      this.socialLogin,
      this.currencyModel,
      this.forgotPasswordVerification,
      this.announcement,
      this.pixelAnalytics,
      this.softwareVersion,
      this.decimalPointSettings,
      this.inhouseSelectedShippingType,
      this.billingInputByCustomer,
      this.minimumOrderLimit,
      this.walletStatus,
      this.loyaltyPointStatus,
      this.loyaltyPointExchangeRate,
      this.loyaltyPointMinimumPoint});

  ConfigDataModel.fromJson(Map<String, dynamic> json) {
    brandSetting = json['brand_setting'];
    digitalProductSetting = json['digital_product_setting'];
    systemDefaultCurrency = json['system_default_currency'];
    digitalPayment = json['digital_payment'];
    cashOnDelivery = json['cash_on_delivery'];
    sellerRegistration = json['seller_registration'];
    baseUrls =
        json['base_urls'] != null ? BaseUrls.fromJson(json['base_urls']) : null;
    staticUrls = json['static_urls'] != null
        ? StaticUrls.fromJson(json['static_urls'])
        : null;
    aboutUs = json['about_us'];
    privacyPolicy = json['privacy_policy'];
    if (json["faq"] != null) {
      faq = json["faq"];
    }

    /* if (json['faq'] != null) {
      faq = <Null>[];
      json['faq'].forEach((v) {
        faq!.add(Null.fromJson(v));
      });
    }*/
    termsConditions = json['terms_&_conditions'];
    if (json['currency_list'] != null) {
      currencyList = <CurrencyList>[];
      json['currency_list'].forEach((v) {
        currencyList!.add(CurrencyList.fromJson(v));
      });
    }
    currencySymbolPosition = json['currency_symbol_position'];
    businessMode = json['business_mode'];
    maintenanceMode = json['maintenance_mode'];
    if (json['language'] != null) {
      language = <Language>[];
      json['language'].forEach((v) {
        language!.add(Language.fromJson(v));
      });
    }
    if (json['colors'] != null) {
      colors = <MColors>[];
      json['colors'].forEach((v) {
        colors!.add(MColors.fromJson(v));
      });
    }
    unit = json['unit'].cast<String>();
    shippingMethod = json['shipping_method'];
    emailVerification = json['email_verification'];
    phoneVerification = json['phone_verification'];
    countryCode = json['country_code'];
    if (json['social_login'] != null) {
      socialLogin = <SocialLogin>[];
      json['social_login'].forEach((v) {
        socialLogin!.add(SocialLogin.fromJson(v));
      });
    }
    currencyModel = json['currency_model'];
    forgotPasswordVerification = json['forgot_password_verification'];
    announcement = json['announcement'] != null
        ? Announcement.fromJson(json['announcement'])
        : null;
    pixelAnalytics = json['pixel_analytics'];
    softwareVersion = json['software_version'];
    decimalPointSettings = json['decimal_point_settings'];
    inhouseSelectedShippingType = json['inhouse_selected_shipping_type'];
    billingInputByCustomer = json['billing_input_by_customer'];
    minimumOrderLimit = json['minimum_order_limit'];
    walletStatus = json['wallet_status'];
    loyaltyPointStatus = json['loyalty_point_status'];
    loyaltyPointExchangeRate = json['loyalty_point_exchange_rate'];
    loyaltyPointMinimumPoint = json['loyalty_point_minimum_point'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['brand_setting'] = brandSetting;
    data['digital_product_setting'] = digitalProductSetting;
    data['system_default_currency'] = systemDefaultCurrency;
    data['digital_payment'] = digitalPayment;
    data['cash_on_delivery'] = cashOnDelivery;
    data['seller_registration'] = sellerRegistration;
    if (baseUrls != null) {
      data['base_urls'] = baseUrls!.toJson();
    }
    if (staticUrls != null) {
      data['static_urls'] = staticUrls!.toJson();
    }
    data['about_us'] = aboutUs;
    data['privacy_policy'] = privacyPolicy;
    if (faq != null) {
      data["faq"] = faq;
    }
    /* if (faq != null) {
      data['faq'] = faq!.map((v) => v.toJson()).toList();
    }*/
    data['terms_&_conditions'] = termsConditions;
    if (currencyList != null) {
      data['currency_list'] = currencyList!.map((v) => v.toJson()).toList();
    }
    data['currency_symbol_position'] = currencySymbolPosition;
    data['business_mode'] = businessMode;
    data['maintenance_mode'] = maintenanceMode;
    if (language != null) {
      data['language'] = language!.map((v) => v.toJson()).toList();
    }
    if (colors != null) {
      data['colors'] = colors!.map((v) => v.toJson()).toList();
    }
    data['unit'] = unit;
    data['shipping_method'] = shippingMethod;
    data['email_verification'] = emailVerification;
    data['phone_verification'] = phoneVerification;
    data['country_code'] = countryCode;
    if (socialLogin != null) {
      data['social_login'] = socialLogin!.map((v) => v.toJson()).toList();
    }
    data['currency_model'] = currencyModel;
    data['forgot_password_verification'] = forgotPasswordVerification;
    if (announcement != null) {
      data['announcement'] = announcement!.toJson();
    }
    data['pixel_analytics'] = pixelAnalytics;
    data['software_version'] = softwareVersion;
    data['decimal_point_settings'] = decimalPointSettings;
    data['inhouse_selected_shipping_type'] = inhouseSelectedShippingType;
    data['billing_input_by_customer'] = billingInputByCustomer;
    data['minimum_order_limit'] = minimumOrderLimit;
    data['wallet_status'] = walletStatus;
    data['loyalty_point_status'] = loyaltyPointStatus;
    data['loyalty_point_exchange_rate'] = loyaltyPointExchangeRate;
    data['loyalty_point_minimum_point'] = loyaltyPointMinimumPoint;
    return data;
  }
}

class BaseUrls {
  String? productImageUrl;
  String? productThumbnailUrl;
  String? digitalProductUrl;
  String? brandImageUrl;
  String? customerImageUrl;
  String? bannerImageUrl;
  String? categoryImageUrl;
  String? reviewImageUrl;
  String? sellerImageUrl;
  String? shopImageUrl;
  String? notificationImageUrl;

  BaseUrls(
      {this.productImageUrl,
      this.productThumbnailUrl,
      this.digitalProductUrl,
      this.brandImageUrl,
      this.customerImageUrl,
      this.bannerImageUrl,
      this.categoryImageUrl,
      this.reviewImageUrl,
      this.sellerImageUrl,
      this.shopImageUrl,
      this.notificationImageUrl});

  BaseUrls.fromJson(Map<String, dynamic> json) {
    productImageUrl = json['product_image_url'];
    productThumbnailUrl = json['product_thumbnail_url'];
    digitalProductUrl = json['digital_product_url'];
    brandImageUrl = json['brand_image_url'];
    customerImageUrl = json['customer_image_url'];
    bannerImageUrl = json['banner_image_url'];
    categoryImageUrl = json['category_image_url'];
    reviewImageUrl = json['review_image_url'];
    sellerImageUrl = json['seller_image_url'];
    shopImageUrl = json['shop_image_url'];
    notificationImageUrl = json['notification_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['product_image_url'] = productImageUrl;
    data['product_thumbnail_url'] = productThumbnailUrl;
    data['digital_product_url'] = digitalProductUrl;
    data['brand_image_url'] = brandImageUrl;
    data['customer_image_url'] = customerImageUrl;
    data['banner_image_url'] = bannerImageUrl;
    data['category_image_url'] = categoryImageUrl;
    data['review_image_url'] = reviewImageUrl;
    data['seller_image_url'] = sellerImageUrl;
    data['shop_image_url'] = shopImageUrl;
    data['notification_image_url'] = notificationImageUrl;
    return data;
  }
}

class StaticUrls {
  String? contactUs;
  String? brands;
  String? categories;
  String? customerAccount;

  StaticUrls(
      {this.contactUs, this.brands, this.categories, this.customerAccount});

  StaticUrls.fromJson(Map<String, dynamic> json) {
    contactUs = json['contact_us'];
    brands = json['brands'];
    categories = json['categories'];
    customerAccount = json['customer_account'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['contact_us'] = contactUs;
    data['brands'] = brands;
    data['categories'] = categories;
    data['customer_account'] = customerAccount;
    return data;
  }
}

class CurrencyList {
  int? id;
  String? name;
  String? symbol;
  String? code;
  num? exchangeRate;
  int? status;
  String? createdAt;
  String? updatedAt;

  CurrencyList(
      {this.id,
      this.name,
      this.symbol,
      this.code,
      this.exchangeRate,
      this.status,
      this.createdAt,
      this.updatedAt});

  CurrencyList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    code = json['code'];
    exchangeRate = json['exchange_rate'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['symbol'] = symbol;
    data['code'] = code;
    data['exchange_rate'] = exchangeRate;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Language {
  String? code;
  String? name;

  Language({this.code, this.name});

  Language.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = code;
    data['name'] = name;
    return data;
  }
}

class MColors {
  int? id;
  String? name;
  String? code;
  String? createdAt;
  String? updatedAt;

  MColors({this.id, this.name, this.code, this.createdAt, this.updatedAt});

  MColors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class SocialLogin {
  String? loginMedium;
  bool? status;

  SocialLogin({this.loginMedium, this.status});

  SocialLogin.fromJson(Map<String, dynamic> json) {
    loginMedium = json['login_medium'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['login_medium'] = loginMedium;
    data['status'] = status;
    return data;
  }
}

class Announcement {
  String? status;
  String? color;
  String? textColor;
  String? announcement;

  Announcement({this.status, this.color, this.textColor, this.announcement});

  Announcement.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    color = json['color'];
    textColor = json['text_color'];
    announcement = json['announcement'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['color'] = color;
    data['text_color'] = textColor;
    data['announcement'] = announcement;
    return data;
  }
}
