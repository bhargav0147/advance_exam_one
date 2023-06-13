// To parse this JSON data, do
//
//     final appModal = appModalFromJson(jsonString);

import 'dart:convert';

AppModal appModalFromJson(String str) => AppModal.fromJson(json.decode(str));

String appModalToJson(AppModal data) => json.encode(data.toJson());

class AppModal {
  String? status;
  String? requestId;
  List<Datum>? data;

  AppModal({
    this.status,
    this.requestId,
    this.data,
  });

  factory AppModal.fromJson(Map<String, dynamic> json) => AppModal(
    status: json["status"],
    requestId: json["request_id"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "request_id": requestId,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? productId;
  String? productIdV2;
  String? productTitle;
  String? productDescription;
  List<String>? productPhotos;
  ProductAttributes? productAttributes;
  double? productRating;
  String? productPageUrl;
  String? productOffersPageUrl;
  String? productSpecsPageUrl;
  String? productReviewsPageUrl;
  int? productNumReviews;
  List<String>? typicalPriceRange;
  Offer? offer;

  Datum({
    this.productId,
    this.productIdV2,
    this.productTitle,
    this.productDescription,
    this.productPhotos,
    this.productAttributes,
    this.productRating,
    this.productPageUrl,
    this.productOffersPageUrl,
    this.productSpecsPageUrl,
    this.productReviewsPageUrl,
    this.productNumReviews,
    this.typicalPriceRange,
    this.offer,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    productId: json["product_id"],
    productIdV2: json["product_id_v2"],
    productTitle: json["product_title"],
    productDescription: json["product_description"],
    productPhotos: json["product_photos"] == null ? [] : List<String>.from(json["product_photos"]!.map((x) => x)),
    // productAttributes: json["product_attributes"] == null ? null : ProductAttributes.fromJson(json["product_attributes"]),
    productRating: json["product_rating"]?.toDouble(),
    productPageUrl: json["product_page_url"],
    productOffersPageUrl: json["product_offers_page_url"],
    productSpecsPageUrl: json["product_specs_page_url"],
    productReviewsPageUrl: json["product_reviews_page_url"],
    productNumReviews: json["product_num_reviews"],
    typicalPriceRange: json["typical_price_range"] == null ? [] : List<String>.from(json["typical_price_range"]!.map((x) => x)),
    offer: json["offer"] == null ? null : Offer.fromJson(json["offer"]),
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "product_id_v2": productIdV2,
    "product_title": productTitle,
    "product_description": productDescription,
    "product_photos": productPhotos == null ? [] : List<dynamic>.from(productPhotos!.map((x) => x)),
    "product_attributes": productAttributes?.toJson(),
    "product_rating": productRating,
    "product_page_url": productPageUrl,
    "product_offers_page_url": productOffersPageUrl,
    "product_specs_page_url": productSpecsPageUrl,
    "product_reviews_page_url": productReviewsPageUrl,
    "product_num_reviews": productNumReviews,
    "typical_price_range": typicalPriceRange == null ? [] : List<dynamic>.from(typicalPriceRange!.map((x) => x)),
    "offer": offer?.toJson(),
  };
}

class Offer {
  String? storeName;
  double? storeRating;
  String? offerPageUrl;
  int? storeReviewCount;
  String? storeReviewsPageUrl;
  String? price;
  String? shipping;
  String? tax;
  bool? onSale;
  String? originalPrice;
  ProductCondition? productCondition;

  Offer({
    this.storeName,
    this.storeRating,
    this.offerPageUrl,
    this.storeReviewCount,
    this.storeReviewsPageUrl,
    this.price,
    this.shipping,
    this.tax,
    this.onSale,
    this.originalPrice,
    this.productCondition,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
    storeName: json["store_name"],
    storeRating: json["store_rating"]?.toDouble(),
    offerPageUrl: json["offer_page_url"],
    storeReviewCount: json["store_review_count"],
    storeReviewsPageUrl: json["store_reviews_page_url"],
    price: json["price"],
    shipping: json["shipping"],
    tax: json["tax"],
    onSale: json["on_sale"],
    originalPrice: json["original_price"],
    productCondition: productConditionValues.map[json["product_condition"]]!,
  );

  Map<String, dynamic> toJson() => {
    "store_name": storeName,
    "store_rating": storeRating,
    "offer_page_url": offerPageUrl,
    "store_review_count": storeReviewCount,
    "store_reviews_page_url": storeReviewsPageUrl,
    "price": price,
    "shipping": shipping,
    "tax": tax,
    "on_sale": onSale,
    "original_price": originalPrice,
    "product_condition": productConditionValues.reverse[productCondition],
  };
}

enum ProductCondition { NEW }

final productConditionValues = EnumValues({
  "NEW": ProductCondition.NEW
});

class ProductAttributes {
  Department? department;
  String? size;
  String? material;
  String? features;
  String? color;
  ClosureStyle? closureStyle;
  Style? style;
  String? toeStyle;
  String? athleticStyle;

  ProductAttributes({
    this.department,
    this.size,
    this.material,
    this.features,
    this.color,
    this.closureStyle,
    this.style,
    this.toeStyle,
    this.athleticStyle,
  });

  factory ProductAttributes.fromJson(Map<String, dynamic> json) => ProductAttributes(
    department: departmentValues.map[json["Department"]]!,
    size: json["Size"],
    material: json["Material"],
    features: json["Features"],
    color: json["Color"],
    // closureStyle: closureStyleValues.map[json["Closure Style"]]!,
    // style: styleValues.map[json["Style"]]!,
    toeStyle: json["Toe Style"],
    athleticStyle: json["Athletic Style"],
  );

  Map<String, dynamic> toJson() => {
    "Department": departmentValues.reverse[department],
    "Size": size,
    "Material": material,
    "Features": features,
    "Color": color,
    "Closure Style": closureStyleValues.reverse[closureStyle],
    "Style": styleValues.reverse[style],
    "Toe Style": toeStyle,
    "Athletic Style": athleticStyle,
  };
}

enum ClosureStyle { LACE_UP, LACE_UP_HOOK_AND_LOOP }

final closureStyleValues = EnumValues({
  "Lace-up": ClosureStyle.LACE_UP,
  "Lace-up, Hook and Loop": ClosureStyle.LACE_UP_HOOK_AND_LOOP
});

enum Department { KIDS_BOYS, MEN_S, KIDS_GIRLS, KIDS, WOMEN_S }

final departmentValues = EnumValues({
  "Kids'": Department.KIDS,
  "Kids', Boys'": Department.KIDS_BOYS,
  "Kids', Girls'": Department.KIDS_GIRLS,
  "Men's": Department.MEN_S,
  "Women's": Department.WOMEN_S
});

enum Style { CASUAL }

final styleValues = EnumValues({
  "Casual": Style.CASUAL
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
