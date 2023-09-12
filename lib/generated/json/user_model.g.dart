import 'package:flutter_blog/generated/json/base/json_convert_content.dart';
import 'package:flutter_blog/model/user_model.dart';

UserModel $UserModelFromJson(Map<String, dynamic> json) {
	final UserModel userModel = UserModel();
	final bool? admin = jsonConvert.convert<bool>(json['admin']);
	if (admin != null) {
		userModel.admin = admin;
	}
	final List<dynamic>? chapterTops = jsonConvert.convertListNotNull<dynamic>(json['chapterTops']);
	if (chapterTops != null) {
		userModel.chapterTops = chapterTops;
	}
	final int? coinCount = jsonConvert.convert<int>(json['coinCount']);
	if (coinCount != null) {
		userModel.coinCount = coinCount;
	}
	final List<dynamic>? collectIds = jsonConvert.convertListNotNull<dynamic>(json['collectIds']);
	if (collectIds != null) {
		userModel.collectIds = collectIds;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		userModel.email = email;
	}
	final String? icon = jsonConvert.convert<String>(json['icon']);
	if (icon != null) {
		userModel.icon = icon;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		userModel.id = id;
	}
	final String? nickname = jsonConvert.convert<String>(json['nickname']);
	if (nickname != null) {
		userModel.nickname = nickname;
	}
	final String? password = jsonConvert.convert<String>(json['password']);
	if (password != null) {
		userModel.password = password;
	}
	final String? publicName = jsonConvert.convert<String>(json['publicName']);
	if (publicName != null) {
		userModel.publicName = publicName;
	}
	final String? token = jsonConvert.convert<String>(json['token']);
	if (token != null) {
		userModel.token = token;
	}
	final int? type = jsonConvert.convert<int>(json['type']);
	if (type != null) {
		userModel.type = type;
	}
	final String? username = jsonConvert.convert<String>(json['username']);
	if (username != null) {
		userModel.username = username;
	}
	return userModel;
}

Map<String, dynamic> $UserModelToJson(UserModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['admin'] = entity.admin;
	data['chapterTops'] =  entity.chapterTops;
	data['coinCount'] = entity.coinCount;
	data['collectIds'] =  entity.collectIds;
	data['email'] = entity.email;
	data['icon'] = entity.icon;
	data['id'] = entity.id;
	data['nickname'] = entity.nickname;
	data['password'] = entity.password;
	data['publicName'] = entity.publicName;
	data['token'] = entity.token;
	data['type'] = entity.type;
	data['username'] = entity.username;
	return data;
}