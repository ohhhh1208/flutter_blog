import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../helper/refresh_helper.dart';
import '../../model/article_model.dart';
import '../../provider/provider_widget.dart';
import '../../view_model/main_page_view_model.dart';
import '../../widget/main_article_item_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ProviderWidget<MainPageViewModel>(
      model: MainPageViewModel(),
      onModelReady: (model) {
        model.initData();
      },
      builder: (context, model, child) {
        return SmartRefresher(
          controller: model.refreshController,
          header: const WaterDropHeader(),
          footer: RefresherFooter(),
          onRefresh: model.refresh,
          onLoading: model.loadMore,
          enablePullUp: true,
          child: ListView.builder(
              itemCount: model.list.length,
              itemBuilder: (context, index) {
                ArticleModel item = model.list[index];
                return MainArticleItemWidget(item);
              }),
        );
      },
    );
  }
}
