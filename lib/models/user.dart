import 'dart:convert';

import '../main.dart';
import 'base.dart';
import 'country.dart';
import 'general.dart';

class UserModel extends Model {
  UserModel._();
  static UserModel i = UserModel._();

  late String name;
  late String companyName;
  late String email;
  late String phone;
  late String about;
  late String commercialRegister;
  late CountryModel country;
  late String noOfEmployees;
  late String image;
  late bool isActive;
  late bool isBan;
  late String locale;
  late bool isNotify;
  late bool unreadNotification;
  late String userType;
  late GeneralModel business;
  late String token;
  late DateTime? dateOfEstablishment;

  bool get isAuth => token.isNotEmpty;

  fromJson([Map<String, dynamic>? json]) {
    id = stringFromJson(json, "id");
    token = stringFromJson(json, "token");
    name = stringFromJson(json, "name");
    companyName = stringFromJson(json, "company_name");
    email = stringFromJson(json, "email");
    commercialRegister = stringFromJson(json, "commercial_register");
    phone = stringFromJson(json, "phone");
    country = CountryModel.fromJson(json?["country"]);
    image = stringFromJson(json, "image");
    isActive = boolFromJson(json, "is_active");
    isBan = boolFromJson(json, "is_ban");
    locale = stringFromJson(json, "locale");
    isNotify = boolFromJson(json, "is_notify");
    unreadNotification = boolFromJson(json, "unread_notification");
    userType = stringFromJson(json, "user_type");
    business = GeneralModel.fromJson(json?["business"]);
    noOfEmployees = stringFromJson(json, "no_of_employees");
    dateOfEstablishment = json?['date_of_establishment'] == null ? null : dateFromJson(json, "date_of_establishment");
    about = stringFromJson(json, "about");
  }

  save() {
    Prefs.setString('user', jsonEncode(toJson()));
  }

  clear() {
    Prefs.remove('user');
    fromJson();
  }

  get() {
    String user = Prefs.getString('user') ?? '{}';
    fromJson(jsonDecode(user));
  }

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "company_name": companyName,
        "email": email,
        "phone": phone,
        "country": country.toJson(),
        "image": image,
        "is_active": isActive,
        "is_ban": isBan,
        "locale": locale,
        "is_notify": isNotify,
        "unread_notification": unreadNotification,
        "user_type": userType,
        "token": token,
        "commercial_register": commercialRegister,
        "business": business.toJson(),
        "no_of_employees": noOfEmployees,
        "date_of_establishment": dateOfEstablishment?.toString(),
        "about": about,
      };
}
