import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blog/router/app_pages.dart';
import 'package:flutter_blog/utils/provider_manager.dart';
import 'package:flutter_blog/utils/storage_manager.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'common/screen_util.dart';
import 'generated/l10n.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  await StorageManager.init();
  runApp(const MyApp());
  // Android状态栏透明 splash为白色,所以调整状态栏文字为黑色
  // SystemChrome.setSystemUIOverlayStyle(
  //     const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarBrightness: Brightness.light));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    ScreenUtil.screenSize = screenSize;
    ScreenUtil.statusBarHeight = statusBarHeight;

    //UI有多个State需要监听时,需要用到MultiProvider
    return
        // MultiProvider(
        // providers: providers,
        // child:

        MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Intent',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: AppPages.generateRoute,
      initialRoute: AppRoutes.splash,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      //  home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // ),
    );
  }
}
