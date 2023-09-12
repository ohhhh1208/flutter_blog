import 'package:flutter/foundation.dart';

import '../generated/json/base/json_convert_content.dart';
import '../model/article_model.dart';
import '../model/user_model.dart';
import 'api.dart';
import 'base_result.dart';
import 'http_util.dart';

typedef SuccessOver<T> = Function(T data, bool over);

///  请求仓库
class RequestRepository {
  RequestRepository._();

  static RequestRepository? _instance;

  static RequestRepository? getInstance() {
    _instance ??= RequestRepository._();
    return _instance;
  }

  Future<List<ArticleModel>?> getMainPageArticleList(int page) async {
    String url = Api.apiHome.replaceFirst(RegExp('page'), '${page - 1}');
    var result = await HttpUtil.getInstance()?.get(url);
    BaseResult base = BaseResult.fromJson(result);
    var list = JsonConvert.fromJsonAsT<List<ArticleModel>>(base.data['datas']);
    return list;
  }

  Future<List<ArticleModel>?> getQuestionsPageArticleList(int page) async {
    String url = Api.apiAsk.replaceFirst(RegExp('page'), '${page - 1}');
    var result = await HttpUtil.getInstance()?.get(url);
    BaseResult base = BaseResult.fromJson(result);
    var list = JsonConvert.fromJsonAsT<List<ArticleModel>>(base.data['datas']);
    return list;
  }

  Future<List<ArticleModel>?> getRecommendPageArticleList(int page) async {
    String url = Api.apiSquare.replaceFirst(RegExp('page'), '${page - 1}');
    var result = await HttpUtil.getInstance()?.get(url);
    BaseResult base = BaseResult.fromJson(result);
    var list = JsonConvert.fromJsonAsT<List<ArticleModel>>(base.data['datas']);
    return list;
  }

  Future<UserModel?> login(Map param) async {
    var result = await HttpUtil.getInstance()?.post(Api.apiLogin, data: param);
    BaseResult base = BaseResult.fromJson(result);
    var model = JsonConvert.fromJsonAsT<UserModel>(base.data);
    return model;
  }


  Future<UserModel?> register(Map param) async {
    var result = await HttpUtil.getInstance()?.post(Api.apiRegister, data: param);
    BaseResult base = BaseResult.fromJson(result);
    var model = JsonConvert.fromJsonAsT<UserModel>(base.data);
    return model;
  }
}
