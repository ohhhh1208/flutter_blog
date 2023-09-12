import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/pages/home_tab/questions_page.dart';
import 'package:flutter_blog/pages/home_tab/recommend_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/my_colors.dart';
import '../../../common/my_images.dart';
import '../../../common/my_style.dart';
import '../../../generated/l10n.dart';
import '../../common/screen_util.dart';
import '../../provider/provider_widget.dart';
import '../../router/app_pages.dart';
import '../../view_model/login_page_view_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  bool login = true;
  bool agree = false;
  final _nameC = TextEditingController();
  final _passwordC = TextEditingController();
  final _confirmPwdC = TextEditingController();
  final _pwdFocus = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameC.dispose();
    _passwordC.dispose();
    _confirmPwdC.dispose();
    _pwdFocus.unfocus();
    _pwdFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: ScreenUtil.screenSize.width,
        height: ScreenUtil.screenSize.height,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              MyColors.color_FAD9BD,
              Colors.orange.withOpacity(0.0),
            ],
          ),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: ScreenUtil.statusBarHeight,
          ),
          // Row(
          //   children: [
          //     SizedBox(
          //       width: double.infinity,
          //       child: IconButton(
          //         icon: const Icon(Icons.arrow_back),
          //         onPressed: () {
          //           Navigator.pop(context);
          //         },
          //       ),
          //     ),
          //     Expanded(child: SizedBox()),
          //   ],
          // ),
          Box.vBox16,
          title(),
          Box.vBox24,
          textFieldInput(),
          Box.vBox16,
          loginButton(),
        ]),
      ),
    );
  }

  Widget title() {
    return Row(children: [
      TextButton(
        onPressed: () {
          if (mounted) {
            setState(() {
              login = true;
            });
          }
        },
        child: Text(
          "账号登录",
          style: TextStyle(
            color: login ? Colors.black : MyColors.color_6A6969,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      const Text(
        " | ",
        style: TextStyle(
          color: MyColors.color_E2E3E8_66,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      TextButton(
        onPressed: () {
          if (mounted) {
            setState(() {
              login = false;
            });
          }
        },
        child: Text(
          "账号注册",
          style: TextStyle(
            color: !login ? Colors.black : MyColors.color_6A6969,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ]);
  }

  Widget textFieldInput() {
    return ProviderWidget<LoginPageViewModel>(
      builder: (context, model, child) {
        return Column(children: [
          TextField(
            controller: _nameC,
            decoration: InputDecoration(
              hintText: S.of(context).loginNameHint,
              hintStyle: MyStyles.style_9F9EA6_14,
              counter: const SizedBox.shrink(),
              contentPadding: const EdgeInsets.all(16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
            style: MyStyles.style_black_16_bold500,
            maxLines: 1,
          ),
          DividerStyle.divider1HalfPadding20,
          TextField(
            controller: _passwordC,
            decoration: InputDecoration(
              hintText: S.of(context).password,
              hintStyle: MyStyles.style_9F9EA6_14,
              counter: const SizedBox.shrink(),
              contentPadding: const EdgeInsets.all(16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
            style: MyStyles.style_black_16_bold500,
            maxLines: 1,
          ),
          DividerStyle.divider1HalfPadding20,
          if (!login)
            TextField(
              controller: _confirmPwdC,
              decoration: InputDecoration(
                hintText: S.of(context).rePassword,
                hintStyle: MyStyles.style_9F9EA6_14,
                counter: const SizedBox.shrink(),
                contentPadding: const EdgeInsets.all(16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              style: MyStyles.style_black_16_bold500,
              maxLines: 1,
            ),
          if (!login) DividerStyle.divider1HalfPadding20,
          Box.vBox10,
          Row(
            children: [
              Box.hBox12,
              SizedBox(
                height: 20,
                width: 20,
                child: Checkbox(
                  checkColor: Colors.white,
                  activeColor: MyColors.color_FA4711,
                  value: agree,
                  shape: const CircleBorder(),
                  onChanged: (bool? value) {
                    setState(() {
                      agree = value!;
                    });
                  },
                ),
              ),
              Box.hBox3,
              const Text(
                "我已阅读并同意",
                style: MyStyles.style_black_12,
              ),
              Box.hBox3,
              InkWell(
                onTap: () {},
                child: const Text(
                  "《用户服务条款》",
                  style: MyStyles.color_47C5FF_12,
                ),
              ),
              const Text(
                "与",
                style: MyStyles.style_black_12,
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  "《隐私协议》",
                  style: MyStyles.color_47C5FF_12,
                ),
              ),
            ],
          ),
          Box.vBox5,
        ]);
      },
      model: LoginPageViewModel(),
      /* child: Column(children: [
        TextField(
          controller: _nameC,
          decoration: InputDecoration(
            hintText: S.of(context).loginNameHint,
            hintStyle: MyStyles.style_9F9EA6_14,
            counter: const SizedBox.shrink(),
            contentPadding: const EdgeInsets.all(16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
          style: MyStyles.style_black_16_bold500,
          maxLines: 1,
        ),
        DividerStyle.divider1HalfPadding20,
        TextField(
          controller: _passwordC,
          decoration: InputDecoration(
            hintText: S.of(context).password,
            hintStyle: MyStyles.style_9F9EA6_14,
            counter: const SizedBox.shrink(),
            contentPadding: const EdgeInsets.all(16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
          style: MyStyles.style_black_16_bold500,
          maxLines: 1,
        ),
        DividerStyle.divider1HalfPadding20,
        if (!login)
          TextField(
            controller: _confirmPwdC,
            decoration: InputDecoration(
              hintText: S.of(context).rePassword,
              hintStyle: MyStyles.style_9F9EA6_14,
              counter: const SizedBox.shrink(),
              contentPadding: const EdgeInsets.all(16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
            style: MyStyles.style_black_16_bold500,
            maxLines: 1,
          ),
        if (!login) DividerStyle.divider1HalfPadding20,
        Box.vBox10,
        Row(
          children: [
            Box.hBox12,
            SizedBox(
              height: 20,
              width: 20,
              child: Checkbox(
                checkColor: Colors.white,
                activeColor: MyColors.color_FA4711,
                value: agree,
                shape: const CircleBorder(),
                onChanged: (bool? value) {
                  setState(() {
                    agree = value!;
                  });
                },
              ),
            ),
            Box.hBox3,
            const Text(
              "我已阅读并同意",
              style: MyStyles.style_black_12,
            ),
            Box.hBox3,
            InkWell(
              onTap: () {},
              child: const Text(
                "《用户服务条款》",
                style: MyStyles.color_47C5FF_12,
              ),
            ),
            const Text(
              "与",
              style: MyStyles.style_black_12,
            ),
            InkWell(
              onTap: () {},
              child: const Text(
                "《隐私协议》",
                style: MyStyles.color_47C5FF_12,
              ),
            ),
          ],
        ),
        Box.vBox5,
      ]),*/
    );
  }

  Widget loginButton() {
    return ProviderWidget<LoginPageViewModel>(
      builder: (context, model, child) {
        return ElevatedButton(
          onPressed: () async {
            if (login) {
              bool result = await model.login(_nameC.text, _passwordC.text);
              if (result) {
                Navigator.of(context).pushReplacementNamed(AppRoutes.mainTab);
              }
            } else {
              bool result = await model.register(_nameC.text, _passwordC.text, _confirmPwdC.text);
              if (result) {
                //todo
                Navigator.of(context).pushReplacementNamed(AppRoutes.mainTab);
              }
            }
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: MyColors.color_FA4711,
          ),
          child: Center(
            child: Text(
              login ? S.of(context).viewStateButtonLogin : S.of(context).signUp,
              style: MyStyles.style_white_16,
            ),
          ),
        );
      },
      model: LoginPageViewModel(),
      /* child: ElevatedButton(
        onPressed: () {
          if (login) {

          }
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: MyColors.color_FA4711,
        ),
        child: Center(
          child: Text(
            login ? S.of(context).viewStateButtonLogin : S.of(context).signUp,
            style: MyStyles.style_white_16,
          ),
        ),
      ),*/
    );
  }
}
