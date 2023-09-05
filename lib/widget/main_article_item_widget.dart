import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/image_helper.dart';
import '../common/my_style.dart';
import '../common/screen_util.dart';
import '../model/article_model.dart';

class MainArticleItemWidget extends StatelessWidget {
  final ArticleModel articleModel;
  final GestureTapCallback? onTap;

  const MainArticleItemWidget(this.articleModel, {Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ///接口没有作者头像(?)
              const WrapperImage(
                url: "",
                width: 12,
                height: 12,
                defaultImageHolder: DefaultImageHolder.avatar,
              ),
              Box.hBox6,
              Text(
                articleModel.author ?? "",
                style: MyStyles.style_black_12,
              )
            ],
          ),
          Box.vBox5,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: ScreenUtil.screenSize.width - 90,
                child: Text(
                  articleModel.title ?? "",
                  style: MyStyles.style_black_16_bold,
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                ),
              ),
              WrapperImage(
                url: articleModel.envelopePic ?? "",
                width: 48,
                height: 48,
                defaultImageHolder: DefaultImageHolder.articleCover,
              ),
            ],
          ),
          Box.vBox5,
          Text(
            articleModel.niceShareDate ?? "",
            style: MyStyles.style_B8C0D4_11,
          ),
          // Row(
          //   children: [
          //     Text(
          //       "1776阅读量",
          //       style: MyStyles.style_B8C0D4_11,
          //     ),
          //     Box.hBox6,
          //     Text(
          //       "1点赞",
          //       style: MyStyles.style_B8C0D4_11,
          //     ),
          //     Box.hBox6,
          //     Text(
          //       "7收藏",
          //       style: MyStyles.style_B8C0D4_11,
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
