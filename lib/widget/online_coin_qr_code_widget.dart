import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterdemo/widget/text/text_common.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutterdemo/config/resource_mananger.dart';
import 'package:flutterdemo/event/pause_timer_event.dart';
import 'package:flutterdemo/event/resume_timer_event.dart';
import 'package:flutterdemo/util/event_bus_util.dart';
import 'package:flutterdemo/util/margin_padding_util.dart';
import 'package:flutterdemo/util/extension/extension_util.dart';
import 'package:flutterdemo/widget/button_common.dart';

class OnlineCoinQrCodeWidget extends StatefulWidget {
  final String? qrCode;
  final String? money;
  final VoidCallback? onTimeUp;

  const OnlineCoinQrCodeWidget(
      {Key? key, @required this.qrCode, @required this.money, this.onTimeUp})
      : super(key: key);

  @override
  OnlineCoinQrCodeWidgetState createState() =>
      new OnlineCoinQrCodeWidgetState();
}

class OnlineCoinQrCodeWidgetState extends State<OnlineCoinQrCodeWidget> {
  Timer? _timer;
  int _seconds = 60;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Align(
            alignment: Alignment.center,
            child: Material(
                type: MaterialType.transparency,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Container(
                      color: Colors.white,
                      padding: MarginPaddingUtil.only(
                          left: 40, right: 50, top: 38, bottom: 20),
                      margin: MarginPaddingUtil.only(left: 30, right: 30),
                      child: Row(children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                TextCommon("支付金额",
                                    size: 36, color: ColorsHelper.threeColor),
                                35.widthBox,
                                TextCommon("￥",
                                    size: 40, color: Color(0xFFDB1D11)),
                                TextCommon("${widget.money ?? 0}",
                                    size: 70, color: Color(0xFFDB1D11))
                              ]),
                              TextCommon("请扫二维码支付",
                                  size: 28, color: ColorsHelper.sixColor),
                              28.heightBoxAdapter,
                              OutlineButtonCommon(
                                  width: 250.width,
                                  height: 60.heightAdapter,
                                  text: "取消支付($_seconds秒)",
                                  fontSize: 28,
                                  onTap: () {
                                    Get.back();
                                    Get.back();
                                  },
                                  borderColor: Color(0xFFFFC039),
                                  textColor: Color(0xFFFFC039))
                            ]),
                        Spacer(),
                        Column(children: [
                          Container(
                              padding: MarginPaddingUtil.all(10),
                              child: QrImage(
                                  padding: MarginPaddingUtil.all(0),
                                  data: widget.qrCode ?? "未发现二维码",
                                  version: QrVersions.auto,
                                  foregroundColor: Colors.black,
                                  size: 190.imageSize),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/img_qrcode_border.png"),
                                      fit: BoxFit.fill))),
                          15.heightBoxAdapter,
                          TextCommon("二维码将在一分钟后失效")
                        ])
                      ]))
                ]))));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    EventBusUtil.getInstance().fire(PauseTimerEvent());
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _seconds--;
      if (_seconds <= 0) {
        timer.cancel();
        Get.back();
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer?.cancel();
    print("dispose");
    widget.onTimeUp?.call();
    EventBusUtil.getInstance().fire(ResumeTimerEvent());
  }
}
