import 'package:flutter/material.dart' show Color, Colors;

class SectionTextModel {
  /// 文字要显示的位置,from 0,从0开始
  final int position;

  /// 要显示的文字
  final String text;

  /// 进度条的这个值之前的颜色
  final Color progressColor;

  const SectionTextModel(
      {this.position = -1,
        this.text = '',
        this.progressColor = Colors.transparent});

  @override
  String toString() {
    return 'SectionTextModel{position:$position, text: $text, progressColor: $progressColor}';
  }
}