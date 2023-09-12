import 'package:flutter_blog/generated/json/base/json_field.dart';
import 'package:flutter_blog/generated/json/user_model.g.dart';
import 'dart:convert';

@JsonSerializable()
class UserModel {

	bool? admin;
	List<dynamic>? chapterTops;
	int? coinCount;
	List<dynamic>? collectIds;
	String? email;
	String? icon;
	int? id;
	String? nickname;
	String? password;
	String? publicName;
	String? token;
	int? type;
	String? username;
  
  UserModel();

  factory UserModel.fromJson(Map<String, dynamic> json) => $UserModelFromJson(json);

  Map<String, dynamic> toJson() => $UserModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}