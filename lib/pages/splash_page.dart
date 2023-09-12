import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/my_images.dart';
import '../router/app_pages.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  ///用来控制动画的状态
  double opacityLevel = 0.0;

  @override
  void initState() {
    super.initState();
    lazyInitAnim();
  }

  lazyInitAnim() {
    Future.delayed(const Duration(milliseconds: 200), () {
      opacityLevel = 1.0;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: AnimatedOpacity(
            onEnd: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.loginPage);
            },
            opacity: opacityLevel,
            duration: const Duration(milliseconds: 2000),
            child: Container(
              margin: const EdgeInsets.only(top: 120),
              alignment: Alignment.center,
              child: Column(
                children: [
                  // Image.asset(
                  //   MyImages.img_splash,
                  //   fit: BoxFit.fitWidth,
                  //   width: 110,
                  //   height: 110,
                  // ),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: Text(
                      "Welcome to the Intent",
                    ),
                  ),
                ],
              ),
            )));
  }
}
