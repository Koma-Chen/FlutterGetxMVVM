import 'package:flutter/widgets.dart';

mixin AfterFirstFrameLayoutMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => afterFirstFrameLayout(context));
  }

  void afterFirstFrameLayout(BuildContext context);
}
