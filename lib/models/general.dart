
import 'base.dart';

class GeneralModel extends Model {
  late String name;
  late String? key;

  GeneralModel({required this.key, required this.name});

  GeneralModel.fromJson(Map<String, dynamic>? json) {
    name = stringFromJson(json, 'title');
    id = stringFromJson(json, 'id');
  }

  @override
  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
      };
}
