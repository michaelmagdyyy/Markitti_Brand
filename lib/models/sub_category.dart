class SubCategoryModel {
  late final String? brandsSubCategoryId;
  late final String? categoryId;
  late final String? subCategoryNameAr;
  late final String? subCategoryNameEn;
  late final String? subCategoryPhoto;
  late final String? visible;
  late final bool? hasSubSubCategories;

  SubCategoryModel.fromJson(Map<String, dynamic> json) {
    brandsSubCategoryId = json['brands_sub_category_id'];
    categoryId = json['category_id'];
    subCategoryNameAr = json['sub_category_name_ar'];
    subCategoryNameEn = json['sub_category_name_en'];
    subCategoryPhoto = json['sub_category_photo'];
    visible = json['visible'];
    hasSubSubCategories = json['has_sub_sub_categories'];
  }
}
