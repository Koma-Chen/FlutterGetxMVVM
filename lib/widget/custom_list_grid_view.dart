import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutterdemo/widget/custom_frame_separate_widget.dart';
import 'package:keframe/size_cache_widget.dart';

typedef MyListViewWidgetItem = Function(BuildContext context, int index);

class MyListViewWidget extends StatelessWidget {
  final int itemCount;
  final double? cacheExtent;
  final ScrollPhysics? physics;
  final MyListViewWidgetItem itemBuilder;
  final bool? shrinkWrap;
  final EdgeInsetsGeometry? padding;
  final Axis? scrollDirection;
  final ScrollController? controller;

  const MyListViewWidget(
      {Key? key,
      required this.itemCount,
      this.physics,
      required this.itemBuilder,
      this.padding,
      this.shrinkWrap,
      this.scrollDirection,
      this.controller,
      this.cacheExtent})
      : super(key: key);

 @override
  Widget build(BuildContext context) {
   return ListView.builder(
       physics: physics ?? ClampingScrollPhysics(),
       shrinkWrap: shrinkWrap ?? false,
       padding: padding ?? EdgeInsets.all(0),
       itemCount: itemCount,
       controller: controller,
       scrollDirection: scrollDirection ?? Axis.vertical,
       cacheExtent: cacheExtent,
       itemBuilder: (BuildContext context, int index) {
         return AnimationConfiguration.staggeredList(
             position: index,
             duration: const Duration(milliseconds: 375),
             child: ScaleAnimation(
                 child: FadeInAnimation(
                     child: itemBuilder(context, index))));
       });
  }
}


class CustomGridViewWidget extends StatelessWidget {
  final int itemCount;
  final ScrollPhysics? physics;
  final MyListViewWidgetItem itemBuilder;
  final SliverGridDelegate gridDelegate;
  final bool? shrinkWrap;

  const CustomGridViewWidget(
      {Key? key,
      required this.itemCount,
      this.physics,
      required this.itemBuilder,
      required this.gridDelegate,
      this.shrinkWrap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizeCacheWidget(
      child: GridView.builder(
        physics: physics ?? BouncingScrollPhysics(),
        shrinkWrap: shrinkWrap ?? false,
        padding: EdgeInsets.all(0),
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          return CustomFrameSeparateWidget(
            index: index,
            child: AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 375),
                columnCount: itemCount,
                child: ScaleAnimation(
                    child:
                        FadeInAnimation(child: itemBuilder(context, index)))),
          );
        },
        gridDelegate: gridDelegate,
      ),
    );
  }
}
