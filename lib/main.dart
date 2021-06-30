import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterdemo/config/resource_mananger.dart';
import 'package:flutterdemo/config/route_config.dart';
import 'package:flutterdemo/page/splash_page.dart';
import 'package:flutterdemo/util/AddressManager.dart';
import 'package:flutterdemo/util/http/http_Client.dart';
import 'package:flutterdemo/util/http/http_config.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  HttpConfig dioConfig = HttpConfig(
      baseUrl: AddressManager.BASE_URL,
      connectTimeout: 1000,
      receiveTimeout: 10000,
      sendTimeout: 10000);
  HttpClient client = HttpClient(dioConfig: dioConfig);
  Get.put<HttpClient>(client);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]); //屏幕向上显示
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  //指定在应用程序运行时可见的系统叠加，主要对状态栏的操作
  //设置顶部状态栏属性，颜色：透明；图标：黑色
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeData = ThemeData(
      textTheme:
          TextTheme(subhead: TextStyle(textBaseline: TextBaseline.alphabetic)),
      primaryColor: ColorsHelper.primaryColor,
      accentColor: ColorsHelper.primaryColor,
    );

    return OKToast(

        ///使用OKToast包裹你的 MaterialApp,不是包裹你的 Scaffold
        dismissOtherOnShow: true,
        backgroundColor: Color(0xFF3A3A3A),
        position: ToastPosition.center,
        radius: 2,
        textPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        textStyle: TextStyle(color: Colors.white, fontSize: 14),
        child: RefreshConfiguration(
            hideFooterWhenNotFull: true,
            //列表数据不满一页,不触发加载更多

            headerBuilder: () => ClassicHeader(
                  idleText: "下拉可刷新",
                  releaseText: "释放可刷新",
                  refreshingText: "刷新中",
                  completeText: "刷新完成",
                ),
            footerBuilder: () => ClassicFooter(
                  failedText: "加载失败，请点击重试",
                  idleText: "上拉加载更多",
                  loadingText: "加载中...",
                  noDataText: "没有更多数据了",
                  canLoadingText: "释放以便加载更多",
                ),
            child: GetMaterialApp(
              getPages: RouteConfig.getPages,
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              supportedLocales: [const Locale('zh', 'CN')],

              //路由管理方案初始化key
              //响应式框架会自动使您的UI适应不同的屏幕尺寸。
              // 只需创建一次用户界面，即可在手机，平板电脑和台式机上完美显示像素
              builder: (context, widget) => GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () =>
                      SystemChannels.textInput.invokeMethod('TextInput.hide'),
                  child: MediaQuery(
                      data: MediaQuery.of(context).copyWith(
                          textScaleFactor: 1.0, alwaysUse24HourFormat: true),
                      child: ResponsiveWrapper.builder(
                          BouncingScrollWrapper.builder(
                              context, widget ?? Container()),
                          maxWidth: 1200,
                          minWidth: 480,
                          defaultScale: true,
                          breakpoints: [
                            ResponsiveBreakpoint.resize(480, name: MOBILE),
                            ResponsiveBreakpoint.autoScale(800, name: TABLET),
                            ResponsiveBreakpoint.resize(1000, name: DESKTOP)
                          ],
                          background: Container(color: Colors.white)))),
              // builder: BotToastInit(),
              initialRoute: "/",
              debugShowCheckedModeBanner: true,
              //导航观察器
              theme: themeData,
              routes: {
                // SplashPage().toStringShort(): (context) => SplashPage(),
                // LoginPage().toStringShort(): (context) => LoginPage(),
                // HomePage().toStringShort(): (context) => HomePage(),
              },
              home: ScreenUtilInit(
                  designSize: Size(750, 1624), builder: () => SplashPage()),
            )));
  }
}
