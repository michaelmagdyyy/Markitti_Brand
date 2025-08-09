class SubBrandModel {
  late final String? brandId;
  late final String? brandNameEn;
  late final String? brandNameAr;
  late final String? brandLogo;
  late final String? bannerImage;
  late final String? customerBrandDiscountPercentage;
  late final String? customerBrandPurchasesLimit;

  SubBrandModel.fromJson(Map<String, dynamic> json) {
    brandId = json['brand_id'];
    brandNameEn = json['brand_name_en'];
    brandNameAr = json['brand_name_ar'];
    brandLogo = json['brand_logo'];
    bannerImage = json['banner_image'];
    customerBrandDiscountPercentage = json['customer_brand_discount_percentage'];
    customerBrandPurchasesLimit = json['customer_brand_purchases_limit'];
  }
}
