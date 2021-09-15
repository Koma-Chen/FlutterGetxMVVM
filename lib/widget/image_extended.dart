import 'dart:io';
import 'dart:typed_data';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/widget/my_click_event.dart';

class ImageNetwork extends StatelessWidget {
  final String? url;
  final double? size;
  final double? width;
  final double? height;
  final double? circular;
  final bool? circle;
  final BoxFit fit;
  final bool avatar;
  final String? errImage;
  final Color? color;
  final BlendMode? colorBlendMode;

  ImageNetwork(this.url,
      {this.size,
      this.width,
      this.height,
      this.circular,
      this.circle: false,
      this.fit: BoxFit.cover,
      this.avatar: false,
      this.errImage,
      this.colorBlendMode,
      this.color});

  @override
  Widget build(BuildContext context) {
    return ((url?.isEmpty ?? false) || !(url?.contains("http") ?? false))
        ? ImageCommon(errImage ?? "image_fail", size: size)
        : ExtendedImage.network(url ?? "",
            width: size ?? width,
            height: size ?? height,
            borderRadius: BorderRadius.all(Radius.circular(circular ?? 0)),
            shape: circle ?? false ? BoxShape.circle : BoxShape.rectangle,
            fit: fit,
            cache: true,
            enableMemoryCache: true,
            color: color,
            colorBlendMode: colorBlendMode,
            loadStateChanged: (ExtendedImageState state) {
              switch (state.extendedImageLoadState) {
                case LoadState.loading:
                  return Container(
                      alignment: Alignment.center,
                      width: size ?? width,
                      height: size ?? height,
                      child: CupertinoActivityIndicator());
                  break;
                case LoadState.failed:
                  return avatar
                      ? ImageCommon('avatar_default', size: size)
                      : Container(
                          alignment: Alignment.center,
                          width: size ?? width,
                          height: size ?? height,
                          child: ImageCommon('image_fail',
                              size: (size ?? width ?? height ?? 0) * 0.8),
                        );
                  break;
                default:
                  return null;
                  break;
              }
            },
            mode: ExtendedImageMode.gesture,
            initGestureConfigHandler: (state) {
              return GestureConfig(
                  minScale: 0.9,
                  animationMinScale: 0.7,
                  maxScale: 3.0,
                  animationMaxScale: 3.5,
                  speed: 1.0,
                  inertialSpeed: 100.0,
                  initialScale: 1.0,
                  inPageView: false);
            },
            enableSlideOutPage: true);
  }
}

class ImageAsset extends StatelessWidget {
  final String? asset;
  final double? size;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final double? circular;
  final bool circle;
  final BoxFit fit;
  final VoidCallback? onPress;

  ImageAsset(this.asset,
      {this.size,
      this.width,
      this.height,
      this.borderRadius,
      this.circular,
      this.circle: false,
      this.fit: BoxFit.cover,
      double? minWidth,
      this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: ExtendedImage.asset(
        'assets/images/$asset.png',
        width: size ?? width,
        height: size ?? height,
        borderRadius: BorderRadius.all(Radius.circular(circular ?? 0)),
        shape: circle ? BoxShape.circle : BoxShape.rectangle,
        fit: fit,
        loadStateChanged: (ExtendedImageState state) {
          switch (state.extendedImageLoadState) {
            case LoadState.failed:
              return Container(
                alignment: Alignment.center,
                width: size ?? width,
                height: size ?? height,
                child: ImageCommon('image_fail',
                    size: (size ?? width ?? height ?? 0) * 0.8),
              );
              break;
            default:
              return null;
              break;
          }
        },
      ),
    );
  }
}

class ImageFile extends StatelessWidget {
  final String path;
  final double? size;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final double? circular;
  final bool circle;
  final BoxFit fit;

  ImageFile(this.path,
      {this.size,
      this.width,
      this.height,
      this.borderRadius,
      this.circular,
      this.circle: false,
      this.fit: BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.file(
      File(path),
      width: size ?? width,
      height: size ?? height,
      borderRadius: BorderRadius.all(Radius.circular(circular ?? 0)),
      shape: circle ? BoxShape.circle : BoxShape.rectangle,
      fit: fit,
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.failed:
            return Container(
              alignment: Alignment.center,
              width: size ?? width,
              height: size ?? height,
              child: ImageCommon('image_fail',
                  size: (size ?? width ?? height ?? 0) * 0.8),
            );
            break;
          default:
            return null;
            break;
        }
      },
    );
  }
}

class ImageMemory extends StatelessWidget {
  final Uint8List bytes;
  final double? size;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final double? circular;
  final bool circle;
  final BoxFit fit;

  ImageMemory(this.bytes,
      {this.size,
      this.width,
      this.height,
      this.borderRadius,
      this.circular,
      this.circle: false,
      this.fit: BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.memory(
      bytes,
      width: size ?? width,
      height: size ?? height,
      borderRadius: BorderRadius.all(Radius.circular(circular ?? 0)),
      shape: circle ? BoxShape.circle : BoxShape.rectangle,
      fit: fit,
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.failed:
            return Container(
              alignment: Alignment.center,
              width: size ?? width,
              height: size ?? height,
              child: ImageCommon('image_fail',
                  size: (size ?? width ?? height ?? 0) * 0.8),
            );
            break;
          default:
            return null;
            break;
        }
      },
    );
  }
}

class ImageCommon extends StatelessWidget {
  final String? url;
  final double? size;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final double? circular;
  final bool circle;
  final BoxFit fit;
  final bool avatar;
  final String? errImage;
  final VoidCallback? onPress;
  final BlendMode? colorBlendMode;
  final Color? color;

  const ImageCommon(this.url,
      {this.size,
      this.width,
      this.height,
      this.borderRadius,
      this.circular,
      this.circle = false,
      this.fit = BoxFit.cover,
      this.avatar = false,
      this.errImage,
      this.onPress,
      this.colorBlendMode,
      this.color});

  @override
  Widget build(BuildContext context) {
    Widget result = Container();
    final String? urlTemp = url;
    if (urlTemp == null) return result;
    if (urlTemp.contains("http")) {
      result = ImageNetwork(urlTemp,
          width: width,
          height: height,
          size: size,
          circle: circle,
          circular: circular,
          fit: fit,
          avatar: avatar,
          colorBlendMode: colorBlendMode,
          color: color,
          errImage: errImage);
    } else {
      result = ImageAsset(urlTemp,
          width: width,
          height: height,
          size: size,
          borderRadius: borderRadius,
          circle: circle,
          circular: circular,
          fit: fit);
    }

    return MyGestureDetector(onTap: onPress, child: result);
  }
}
