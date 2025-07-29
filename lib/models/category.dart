class CategoryModel {
  late final String? brandsCategoryId;
  late final String? categoryNameAr;
  late final String? categoryNameEn;
  late final String? categoryPhoto;
  late final String? visible;
  late final String? createdAt;
  late final String? createdBy;
  late final String? updatedAt;
  late final String? updatedBy;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    brandsCategoryId = json['brands_category_id'];
    categoryNameAr = json['category_name_ar'];
    categoryNameEn = json['category_name_en'];
    categoryPhoto = json['category_photo'];
    visible = json['visible'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    updatedAt = json['updated_at'];
    updatedBy = json['updated_by'];
  }
}
