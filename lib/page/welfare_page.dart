import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gankio/Api.dart';
import 'package:flutter_gankio/common/loading_view.dart';
import 'package:flutter_gankio/constant/gank_constant.dart';
import 'package:flutter_gankio/model/gank_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class WelfarePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new WelfarePageState();
  }
}

class WelfarePageState extends State<WelfarePage> {
  List<Result> mItemModels = new List();
  int mCurrentPageIndex = DEFAULT_PAGE_INDEX;
  CancelToken _token = new CancelToken();
  ScrollController _scrollController;
  double scrollDistance = 0.0;
  String _pageIdentifier;
  String _dataIdentifier;
  String _scrollDistanceIdentifier;

  @override
  void initState() {
    super.initState();
    _pageIdentifier = '福利_pageIdentifier';
    _dataIdentifier = '福利_dataIdentifier';
    _scrollDistanceIdentifier = 'scrollDistanceIndentifier';
    scrollDistance = PageStorage.of(context)
            .readState(context, identifier: _scrollDistanceIdentifier) ??
        0.0;
    mItemModels.addAll(PageStorage.of(context)
            .readState(context, identifier: _dataIdentifier) ??
        []);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scrollController = ScrollController();

    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      getData(false);
    }
    scrollDistance = _scrollController.position.pixels;
    PageStorage.of(context).writeState(context, scrollDistance,
        identifier: _scrollDistanceIdentifier);
    setState(() {});
  }

  @override
  void dispose() {
    _token?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(WELFARE_MODULE_NAME),
      ),
      body: new RefreshIndicator(
          child: _buildRefreshContent(),
          onRefresh: _refresh),
    );
  }

  Future<Null> _refresh() {
    mCurrentPageIndex = DEFAULT_PAGE_INDEX;
    return getData(true);
  }

  Future<Null> _loadMore() {
    return getData(false);
  }

  ///获取图片列表
  Future<Null> getData(bool isRefresh) async {
    if (isRefresh) {
      mItemModels.clear();
    }
    //请求数据
    if (!isRefresh) {
      mCurrentPageIndex++;
    }
    Dio dio = new Dio();
    String url = "${Api.BASE_URL}/data/福利/10/$mCurrentPageIndex";
    Response response = await dio.get(url, cancelToken: _token);
    GankModel model = GankModel.fromJson(response.data);
    mItemModels.addAll(model.results);
    PageStorage.of(context)
        .writeState(context, mItemModels, identifier: _dataIdentifier);
    PageStorage.of(context)
        .writeState(context, mCurrentPageIndex, identifier: _pageIdentifier);
    setState(() {});
  }

  Widget _buildRefreshContent() {
    if (mItemModels.isEmpty) {
      //第一次加载，先显示Loading
      getData(true);
      return new LoadingView();
    } else {
      return new StaggeredGridView.countBuilder(
        padding: const EdgeInsets.all(1.0),
        crossAxisCount:
            MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 4,
        mainAxisSpacing: 1.0,
        itemCount: mItemModels.length,
        crossAxisSpacing: 1.0,
        itemBuilder: (BuildContext context, int index) =>
            _buildImageItem(mItemModels.elementAt(index)),
        staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
      );
    }
  }

  Widget _buildImageItem(Result model) {
    return new GestureDetector(
      onTap: () {},
      child: new Hero(
          tag: model.url, child: CachedNetworkImage(imageUrl: model.url)),
    );
  }
}
