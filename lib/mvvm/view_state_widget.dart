import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/config/resource_mananger.dart';
import 'package:flutterdemo/mvvm/base/base_view_model.dart';
import 'package:flutterdemo/widget/image_extended.dart';
import 'package:flutterdemo/util/extension/extension_util.dart';
import 'package:flutterdemo/widget/text/text_common.dart';

Widget viewStateBuilder(
    BuildContext context, BaseViewModel model, VoidCallback onTap,
    {BaseViewModel? model2,
    Widget? empty,
    String? emptyImageStr,
    double paddingHeight = 0}) {
  if (model.busy || (model2 != null && model2.busy)) {
    return ViewStateBusyWidget();
  } else if (model.empty || (model2 != null && model2.empty)) {
    return ViewStateEmptyWidget(empty: empty, emptyImageStr: emptyImageStr);
  } else if (model.error || (model2 != null && model2.error)) {
    return ViewStateErrorWidget(
      onTap: onTap,
      paddingHeight: paddingHeight,
    );
  }
  return Container();
}

/// 加载中
class ViewStateBusyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoActivityIndicator(
              radius: 20,
            ),
            SizedBox(
              height: 20,
            ),
            TextCommon(
              "加载中...",
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}

/// 页面无数据
class ViewStateEmptyWidget extends StatelessWidget {
  final Widget? empty;
  final String? emptyImageStr;

  const ViewStateEmptyWidget({Key? key, this.empty, this.emptyImageStr})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return empty ??
        Center(
          child: Container(
            width: double.infinity,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ImageCommon(
                  emptyImageStr ?? 'img_common_empty',
                  width: 200.width,
                  height: 300.heightAdapter,
                ),
                13.heightBoxAdapter,
                TextCommon(
                  '内容空空如也~',
                  color: ColorsHelper.nineColor,
                  size: 26,
                  height: 37,
                ),
              ],
            ),
          ),
        );
  }
}

/// 页面加载失败
class ViewStateErrorWidget extends StatelessWidget {
  final Widget? image;
  final String? message;
  final String? text;
  final VoidCallback? onTap;
  final double paddingHeight;

  ViewStateErrorWidget(
      {Key? key,
      this.image,
      this.message,
      this.text,
      @required this.onTap,
      this.paddingHeight = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          paddingHeight.heightBoxAdapter,
          image ??
              ImageCommon(
                'img_error_page',
                size: 292.imageSize,
              ),
          9.heightBoxAdapter,
          TextCommon(
            message ?? '请求出错,请点重新加载试试~',
            size: 26,
            height: 37,
            color: ColorsHelper.threeColor,
          ),
          20.heightBoxAdapter,
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: Container(
              width: 250.width,
              height: 88.height,
              alignment: Alignment.center,
              child: TextCommon(
                "重新加载",
                size: 30,
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(45)),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFFCFFAF), Color(0xFF919212)],
                    stops: [0, 1]),
              ),
            ),
            onTap: onTap,
          )
        ],
      ),
    );
  }
}
