import 'package:flutter_blog/generated/json/base/json_field.dart';
import 'package:flutter_blog/generated/json/article_model.g.dart';
import 'dart:convert';

@JsonSerializable()
class ArticleModel {

	bool? adminAdd;
	String? apkLink;
	int? audit;
	String? author;
	bool? canEdit;
	int? chapterId;
	String? chapterName;
	bool? collect;
	int? courseId;
	String? desc;
	String? descMd;
	String? envelopePic;
	bool? fresh;
	String? host;
	int? id;
	bool? isAdminAdd;
	String? link;
	String? niceDate;
	String? niceShareDate;
	String? origin;
	String? prefix;
	String? projectLink;
	int? publishTime;
	int? realSuperChapterId;
	int? selfVisible;
	int? shareDate;
	String? shareUser;
	int? superChapterId;
	String? superChapterName;
	List<dynamic>? tags;
	String? title;
	int? type;
	int? userId;
	int? visible;
	int? zan;
  
  ArticleModel();

  factory ArticleModel.fromJson(Map<String, dynamic> json) => $ArticleModelFromJson(json);

  Map<String, dynamic> toJson() => $ArticleModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}