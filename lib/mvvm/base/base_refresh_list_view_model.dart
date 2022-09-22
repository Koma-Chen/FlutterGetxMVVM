import 'package:flutterdemo/mvvm/base/base_list_view_model.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

/// 基于
abstract class BaseRefreshListModel<T> extends BaseListViewModel<T> {
  /// 分页第一页页码
  static const int pageNumFirst = 1;

  /// 分页条目数量
  int pageSize = 20;

  /// 分页第一页数据下标
  // static const int pageNumFirst = 0;



  ///是否可以上拉加载更多数据
  static const bool canLoadMore = true;

  final RefreshController _refreshController = RefreshController();

  RefreshController get refreshController => _refreshController;

  /// 当前页码
  int _currentPageNum = pageNumFirst;

  /// 下拉刷新
  ///
  /// [init] 是否是第一次加载
  /// true:  Error时,需要跳转页面
  /// false: Error时,不需要跳转页面,直接给出提示
  Future<List<T>> refresh({bool init = false}) async {
    try {
      _currentPageNum = pageNumFirst;
      final data = await loadData(pageNum: pageNumFirst);
      if (data.isEmpty) {
        refreshController.refreshCompleted(resetFooterState: true);
        list.clear();
        setEmpty();
      } else {
        onCompleted(data);
        list.clear();
        list.addAll(data);
        refreshController.refreshCompleted();
        // 小于分页的数量,禁止上拉加载更多
        if (data.length < pageSize) {
          refreshController.loadNoData();
        } else {
          //防止上次上拉加载更多失败,需要重置状态
          refreshController.loadComplete();
        }
        setIdle();
      }
      return data;
    } catch (e, s) {
      /// 页面已经加载了数据,如果刷新报错,不应该直接跳转错误页面
      /// 而是显示之前的页面数据.给出错误提示
      if (init) list.clear();
      refreshController.refreshFailed();
      setError(e, s);
      return [];
    }
  }

  /// 上拉加载更多
  Future<List<T>> loadMore() async {
    try {
      _currentPageNum = _currentPageNum + 1;
      var data = await loadData(pageNum: _currentPageNum);
      if (data.isEmpty) {
        _currentPageNum = _currentPageNum - 1;
        if (_currentPageNum < 0) _currentPageNum = 0;
        refreshController.loadNoData();
      } else {
        onCompleted(data);
        list.addAll(data);
        if (data.length < pageSize) {
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
        update();
      }
      return data;
    } catch (e, s) {
      _currentPageNum = _currentPageNum - _currentPageNum * pageSize;
      refreshController.loadFailed();
      print('error--->\n' + e.toString());
      print('statck--->\n' + s.toString());
      return [];
    }
  }

  // 加载数据
  Future<List<T>> loadData({int pageNum});

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
}
