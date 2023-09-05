import 'package:flutter_blog/model/article_model.dart';

import '../net/request_repository.dart';
import '../provider/view_state_refresh_list_model.dart';

class MainPageViewModel extends ViewStateRefreshListModel<ArticleModel> {

  @override
  Future<List<ArticleModel>> loadData({int? pageNum}) async {
    return await RequestRepository.getInstance()?.getMainPageArticleList(pageNum ?? 1) ?? [];
  }
}
