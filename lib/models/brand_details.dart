class BrandDetailsModel {
  late final String? status;
  late final String? availablePurchaseLimit;
  late final String? subscribtionStatus;
  late final Brand? brand;
  late final List<Branches>? branches;
  late final List<Photos>? photos;
  late final List<Videos>? videos;

  BrandDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    availablePurchaseLimit = json['available_purchase_limit'];
    subscribtionStatus = json['subscribtion_status'];
    brand = Brand.fromJson(json['brand']);
    branches = List.from(json['branches']).map((e) => Branches.fromJson(e)).toList();
    photos = List.from(json['photos']).map((e) => Photos.fromJson(e)).toList();
    videos = List.from(json['videos']).map((e) => Videos.fromJson(e)).toList();
  }
}

class Brand {
  late final String? brandsDataId;
  late final String? categoryId;
  late final String? subCategoryId;
  late final String? subSubCategoryId;
  late final String? userId;
  late final String? brandNameEn;
  late final String? brandNameAr;
  late final String? brandLogo;
  late final String? descriptionEn;
  late final String? descriptionAr;
  late final String? rolesEn;
  late final String? rolesAr;
  late final String? eMail;
  late final String? brandMobileNumber;
  late final String? brandAuthCode;
  late final String? brandPass;
  late final String? facebookPage;
  late final String? youtubeChannelLink;
  late final String? instagramLink;
  late final String? visible;
  late final String? bannerImage;
  late final String? lastLoginAt;
  late final String? createdAt;
  late final String? createdBy;
  late final String? updatedAt;
  late final String? updatedBy;
  late final String? updatedAtByBrand;

  Brand.fromJson(Map<String, dynamic> json) {
    brandsDataId = json['brands_data_id'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    subSubCategoryId = json['sub_sub_category_id'];
    userId = json['user_id'];
    brandNameEn = json['brand_name_en'];
    brandNameAr = json['brand_name_ar'];
    brandLogo = json['brand_logo'];
    descriptionEn = json['description_en'];
    descriptionAr = json['description_ar'];
    rolesEn = json['roles_en'];
    rolesAr = json['roles_ar'];
    eMail = json['e_mail'];
    brandMobileNumber = json['brand_mobile_number'];
    brandAuthCode = json['brand_auth_code'];
    brandPass = json['brand_pass'];
    facebookPage = json['facebook_page'];
    youtubeChannelLink = json['youtube_channel_link'];
    instagramLink = json['instagram_link'];
    visible = json['visible'];
    bannerImage = json['banner_image'];
    lastLoginAt = json['last_login_at'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    updatedAt = json['updated_at'];
    updatedBy = json['updated_by'];
    updatedAtByBrand = json['updated_at_by_brand'];
  }
}

class Branches {
  late final String? brandsBranchesId;
  late final String? categoryId;
  late final String? subCategoryId;
  late final String? subSubCategoryId;
  late final String? brandId;
  late final String? branchProvinceId;
  late final String? branchAreaId;
  late final String? branchNameEn;
  late final String? branchNameAr;
  late final String? branchUserName;
  late final String? branchAddress;
  late final String? branchLocation;
  late final String? branchMobile_1;
  late final String? branchMobile_2;
  late final String? tel_1;
  late final String? tel_2;
  late final String? branchAuthenticationCode;
  late final String? branchLoginPassword;
  late final String? status;
  late final String? lastLoginAt;
  late final String? createdAt;
  late final String? createdBy;
  late final String? createdAtByBrand;
  late final String? updatedAtByBrand;
  late final String? provincesId;
  late final String? provinceNameEn;
  late final String? provinceNameAr;
  late final String? areasId;
  late final String? provinceId;
  late final String? areaNameEn;
  late final String? areaNameAr;

  Branches.fromJson(Map<String, dynamic> json) {
    brandsBranchesId = json['brands_branches_id'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    subSubCategoryId = json['sub_sub_category_id'];
    brandId = json['brand_id'];
    branchProvinceId = json['branch_province_id'];
    branchAreaId = json['branch_area_id'];
    branchNameEn = json['branch_name_en'];
    branchNameAr = json['branch_name_ar'];
    branchUserName = json['branch_user_name'];
    branchAddress = json['branch_address'];
    branchLocation = json['branch_location'];
    branchMobile_1 = json['branch_mobile_1'];
    branchMobile_2 = json['branch_mobile_2'];
    tel_1 = json['tel_1'];
    tel_2 = json['tel_2'];
    branchAuthenticationCode = json['branch_authentication_code'];
    branchLoginPassword = json['branch_login_password'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    provincesId = json['provinces_id'];
    provinceNameEn = json['province_name_en'];
    provinceNameAr = json['province_name_ar'];
    areasId = json['areas_id'];
    provinceId = json['province_id'];
    areaNameEn = json['area_name_en'];
    areaNameAr = json['area_name_ar'];
  }
}

class Photos {
  late final String? brandsPhotosId;
  late final String? brandId;
  late final String? brandPhoto;
  late final String? createdAtByBrand;

  Photos.fromJson(Map<String, dynamic> json) {
    brandsPhotosId = json['brands_photos_id'];
    brandId = json['brand_id'];
    brandPhoto = json['brand_photo'];
  }
}

class Videos {
  late final String? brandsVideosId;
  late final String? brandId;
  late final String? brandVideoLink;
  late final String? createdAt;
  late final String? createdBy;
  late final String? createdAtByBrand;

  Videos.fromJson(Map<String, dynamic> json) {
    brandsVideosId = json['brands_videos_id'];
    brandId = json['brand_id'];
    brandVideoLink = json['brand_video_link'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    createdAtByBrand = json['created_at_by_brand'];
  }
}
