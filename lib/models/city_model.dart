class CityModel {
  late final int id;
  late final double? lat;
  late final double? lng;
  late final String? location;
  late final String? name;
  late final int countryId;
  late final int? postalCode;
  late final String? createdAt;

  CityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lat = double.tryParse("${json['lat']}");
    lng =double.tryParse("${json['lng']}") ;
    location = json['location'];
    name = json['name'];
    countryId = json['country_id'];
    postalCode = json['postal_code'];
    createdAt = json['created_at'];
  }
}
