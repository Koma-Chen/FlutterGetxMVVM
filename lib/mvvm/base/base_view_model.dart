import 'package:dio/dio.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutterdemo/mvvm/view_state.dart';
import 'package:flutterdemo/widget/dialog/dialog_helper.dart';
import 'package:flutterdemo/widget/toast_util.dart';
import 'package:get/get.dart';
import 'package:flutterdemo/util/extension/extension_util.dart';

class BaseViewModel extends GetxController {
  /// 防止页面销毁后,异步任务才完成,导致报错
  bool disposed = false;

  /// 当前的页面状态,默认为busy,可在viewModel的构造方法中指定;
  ViewState _viewState = ViewState.idle;

  /// 根据状态构造
  ///
  /// 子类可以在构造函数指定需要的页面状态
  /// FooModel():super(viewState:ViewState.busy);
  BaseViewModel({ViewState? viewState})
      : _viewState = viewState ?? ViewState.idle {
    print('ViewStateModel---constructor--->$runtimeType');
  }

  ViewState get viewState => _viewState;

  set viewState(ViewState viewState) {
    _viewStateError = null;
    _viewState = viewState;
    update();
  }

  ViewStateError? _viewStateError;

  ViewStateError? get viewStateError => _viewStateError;

  String get errorMessage => _viewStateError?.message ?? "未知错误";

  /// 以下变量是为了代码书写方便,加入的get方法.严格意义上讲,并不严谨

  bool get busy => viewState == ViewState.busy;

  bool get idle => viewState == ViewState.idle;

  bool get empty => viewState == ViewState.empty;

  bool get error => viewState == ViewState.error;

  bool get unAuthorized => viewState == ViewState.unAuthorized;

  void setIdle() {
    viewState = ViewState.idle;
    SmartDialog.dismiss();
  }

  void setBusy({String? title, int? seconds}) {
    // viewState = ViewState.busy;

    ToastUtil.showLoading(title: title??"加载中...");
  }

  void setEmpty() {
    viewState = ViewState.empty;
    DialogHelper.dismiss();
  }

  void setUnAuthorized() {
    viewState = ViewState.unAuthorized;
    onUnAuthorizedException();
  }

  /// 未授权的回调
  void onUnAuthorizedException() {}

  // [e]分类Error和Exception两种
  void setError(dynamic e, dynamic stackTrace, {String? message}) {
    DialogHelper.dismiss();
    if (e.toString().contains("NotSuccessException")) {
      return;
    }
    ErrorType errorType = ErrorType.defaultError;
    if (e is DioError) {
      e = e.error;
    }
    viewState = ViewState.error;
    _viewStateError = ViewStateError(
      errorType,
      message: message,
      errorMessage: e.toString(),
    );
    printErrorStack(e, stackTrace);
  }

  // 显示错误消息
  void showErrorMessage({String? message}) {
    if (viewStateError != null || message != null) {}
  }

  @override
  void onClose() {
    setIdle();
    disposed = true;
    'view_state_model onClose -->$runtimeType'.printString();
    super.onClose();
  }
}

// [e]为错误类型 :可能为 Error , Exception ,String
// [s]为堆栈信息
void printErrorStack(dynamic e, dynamic s) {
  print('''
<-----↓↓↓↓↓↓↓↓↓↓-----error-----↓↓↓↓↓↓↓↓↓↓----->
$e
<-----↑↑↑↑↑↑↑↑↑↑-----error-----↑↑↑↑↑↑↑↑↑↑----->''');
  if (s != null) print('''
<-----↓↓↓↓↓↓↓↓↓↓-----trace-----↓↓↓↓↓↓↓↓↓↓----->
$s
<-----↑↑↑↑↑↑↑↑↑↑-----trace-----↑↑↑↑↑↑↑↑↑↑----->
    ''');
}
