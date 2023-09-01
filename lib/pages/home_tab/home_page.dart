import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/pages/home_tab/questions_page.dart';
import 'package:flutter_blog/pages/home_tab/recommend_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/my_colors.dart';
import '../../common/my_images.dart';
import '../../common/my_style.dart';
import '../../generated/l10n.dart';
import 'main_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          top: true,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    alignment: Alignment.topLeft,

                    ///导航栏
                    child: TabBar(
                      isScrollable: true,
                      labelColor: MyColors.color_24CF5F,
                      unselectedLabelColor: MyColors.color_B8C0D4,
                      controller: tabController,
                      labelStyle: MyStyles.style_FE8C28_24_bold,
                      unselectedLabelStyle: MyStyles.style_FFAE2E_16,
                      tabs: [
                        Tab(text: S.of(context).tabHome),
                        Tab(text: S.of(context).recommend),
                        Tab(text: S.of(context).tabHome),
                      ],
                    ),
                  ),

                  ///间隔
                  const Expanded(child: SizedBox()),

                  ///搜索框
                  InkWell(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    onTap: () {},
                    child: SvgPicture.asset(
                      MyImages.ic_search,
                      theme: const SvgTheme(
                        currentColor: Colors.black87,
                      ),
                      width: 30,
                    ),
                  ),

                  Box.hBox20
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: const [MainPage(), RecommendPage(), QuestionsPage()],
                ),
              ),
            ],
          )),
    );
  }
}
