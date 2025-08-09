import 'base.dart';

class CountryModel extends Model {
  late final String name, nationality, phoneCode, showPhoneCode, image, shortName;
  late final int maxLength, nationalIdLimit;

  CountryModel.fromJson([Map<String, dynamic>? json]) {
    id = stringFromJson(json, 'id');
    name = stringFromJson(json, "name");
    nationality = stringFromJson(json, "nationality");
    phoneCode = stringFromJson(json, "phone_code");
    showPhoneCode = stringFromJson(json, "show_phone_code");
    image = stringFromJson(json, "image");
    shortName = stringFromJson(json, "short_name");
    maxLength = intFromJson(json, "max_length");
    nationalIdLimit = intFromJson(json, "national_id_limit");
  }

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "nationality": nationality,
        "phone_code": phoneCode,
        "show_phone_code": showPhoneCode,
        "image": image,
        "short_name": shortName,
        "phone_number_limit": maxLength,
        "national_id_limit": nationalIdLimit,
      };
}
