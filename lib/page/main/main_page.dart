import 'package:flutter/material.dart';
import 'package:flutterdemo/mvvm/base/base_state.dart';
import 'package:flutterdemo/util/extension/extension_util.dart';
import 'package:flutterdemo/util/margin_padding_util.dart';
import 'package:flutterdemo/viewmodel/main_view_model.dart';
import 'package:get/get.dart';

class MainPage extends BaseState<MainViewModel> {
  final mViewModel = Get.put(MainViewModel());
  final controller = TextEditingController();

  RxString test = "".obs;

  ScrollController _scrollController = ScrollController();

  @override
  void initData(BuildContext context) {
    // Future.delayed(Duration(seconds: 2), () {
    //   mViewModel.login();
    //   ToastUtil.showLoading(title: "loading...");
    // });
    // ever(test, (_) => print("${_} has been changed"));
    // interval(test, (_) => print("interval $_"), time: Duration(seconds: 1));
    debounce(test, (_) => print("debouce$_"), time: Duration(seconds: 1));
  }

  @override
  Widget initView(BuildContext context, MainViewModel? model) {
    // return BaseScaffold(
    //     appBar: AppBar(
    //       title: const Text(''),
    //     ),
    //     body: Column(
    //       children: [
    //         _buildTestWidget(() {
    //           print("没有更多数据了，不用再上拉了 ");
    //         }),
    //         Obx(() => TextCommon(model?.bean.value.token ?? "")),
    //         Container(
    //           width: 100,
    //           height: 100,
    //           child: TextFieldCommon(
    //             controller: controller,
    //             hintText: "111",
    //             onChanged: (text) {
    //               test.value = text;
    //             },
    //           ),
    //         ),
    //         // TextCommon(model?.bean.value.token ?? ""),
    //       ],
    //     ));
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          _buildPersistentHeader(),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                title: Text("Item $index"),
              ),
              childCount: 30,
            ),
          )

          // SliverToBoxAdapter(
          //   child: Column(
          //     children: <Widget>[
          //       Container(
          //         height: 200,
          //         alignment: Alignment.topCenter,
          //         decoration: BoxDecoration(
          //           image: DecorationImage(
          //               image: NetworkImage(swipperBgImageUrl),
          //               fit: BoxFit.fitWidth,
          //               alignment: Alignment.bottomCenter),
          //         ),
          //         child: SwipperImage(
          //           width: MediaQuery.of(context).size.width,
          //           // backgroundImage: NetworkImage(swipperBgImageUrl),
          //           swipperOptionsList: swipperOptionsList,
          //         ),
          //       ),
          //       Container(
          //         height: 160,
          //         decoration: BoxDecoration(
          //             image: DecorationImage(
          //               image: NetworkImage(
          //                   "https://m.360buyimg.com/mobilecms/s1125x435_jfs/t1/69613/13/4742/97849/5d2ef146Eaf504529/35e8041bf0dac25d.jpg.dpg.webp"),
          //               fit: BoxFit.fitWidth,
          //             )),
          //         child: PageView(
          //           scrollDirection: Axis.horizontal,
          //           children: <Widget>[
          //             Floor(
          //               floorList: floorList.length >= 10
          //                   ? floorList.getRange(0, 10)?.toList()
          //                   : [],
          //             ),
          //             Floor(
          //               floorList: floorList.length >= 20
          //                   ? floorList.getRange(10, 20)?.toList()
          //                   : [],
          //             ),
          //           ],
          //         ),
          //       ),
          //       Image.network(
          //           "https://m.360buyimg.com/mobilecms/jfs/t1/55537/13/5336/79992/5d2eeea7E5b9166b0/57bda184a914540a.jpg!q70.jpg.dpg.webp"),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }

  Widget _buildPersistentHeader() => SliverPersistentHeader(
      pinned: true,
      floating: false,
      delegate: PersistentHeaderBuilder(
          builder: (ctx, offset) {
            print("offset:$offset");
            return Container(
              alignment: Alignment.bottomCenter,
              color: Colors.orangeAccent,
              child: Container(
                margin: MarginPaddingUtil.only(bottom: 30),
                height: 60.height,
                width: offset <= 60
                    ? 700.width - offset.height * 2
                    : 700.width - 60.height * 2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: TextField(
                  style: TextStyle(fontFamily: "PingFang"),
                  decoration: InputDecoration(
                    hintText: '请输入商品名称',
                    hintStyle: TextStyle(
                      fontSize: 12,
                    ),
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    suffixIcon: Icon(
                      Icons.camera_alt,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            );
          },
          max: 250.height,
          min: 150.height));
}

class PersistentHeaderBuilder extends SliverPersistentHeaderDelegate {
  final double max;
  final double min;
  final Widget Function(BuildContext context, double offset) builder;

  PersistentHeaderBuilder(
      {this.max = 120, this.min = 80, required this.builder})
      : assert(max >= min && builder != null);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return builder(context, shrinkOffset);
  }

  @override
  double get maxExtent => max;

  @override
  double get minExtent => min;

  @override
  bool shouldRebuild(covariant PersistentHeaderBuilder oldDelegate) =>
      max != oldDelegate.max ||
      min != oldDelegate.min ||
      builder != oldDelegate.builder;
}
