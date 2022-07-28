import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_core/m_core.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

///
/// Created by Handy on 24/07/22
/// HP Pro Book 430 G1
/// Email : it.handy@borwita.co.id
///

class SearchIssuesPage extends StatefulWidget {

  final bool isLazyLoading;
  final String keyword;

  const SearchIssuesPage({Key? key, required this.isLazyLoading, required this.keyword}) : super(key: key);

  @override
  State<SearchIssuesPage> createState() => _SearchIssuesPageState();
}

class _SearchIssuesPageState extends State<SearchIssuesPage> {

  List<SearchIssuesModel>? _listSearchIssues;

  // At the beginning, we fetch the first 20 posts
  int _page = 1;

  // There is next page or not
  bool _hasNextPage = true;

  // Used to display loading indicators when _firstLoad function is running
  bool _isFirstLoadRunning = false;

  // Used to display loading indicators when _loadMore function is running
  bool _isLoadMoreRunning = false;

  // The controller for the ListView
  late ScrollController _controller;

  /// Pagination
  int rowsPerPage = 10;
  double pageCount = 0;
  static const double dataPagerHeight = 70.0;
  List<SearchIssuesModel> _paginatedIssuesData = [];
  bool showLoadingIndicator = false;

  @override
  void initState() {
    super.initState();
    _listSearchIssues = [];
    _firstLoadSearchIssues(widget.keyword, _page);

    /// Lazy Loading.
    _controller = ScrollController()..addListener(_loadMoreSearchIssues);

    /// Pagination.
    pageCount = (_listSearchIssues!.length / rowsPerPage).ceilToDouble();
  }

  @override
  void dispose() {
    _controller.removeListener(_loadMoreSearchIssues);
    super.dispose();
  }

  Future<void> _firstLoadSearchIssues(String keyword, int? pages) async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    Future.microtask(() => {
      BlocProvider.of<SearchIssuesCubit>(context).get(keyword, pages),
    });
  }

  void _loadMoreSearchIssues() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller.position.extentAfter < 300) {
      setState(() {
        _isFirstLoadRunning = false;
      });
      setState(() {
        _isLoadMoreRunning = true; // Display a progress indicator at the bottom
      });
      _page += 1; // Increase _page by 1
      await _firstLoadSearchIssues(widget.keyword, _page);
    }
  }

  Widget indexBuilder(BuildContext context, int index) {
    final SearchIssuesModel data = _paginatedIssuesData[index];
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: LayoutBuilder(
        builder: (context, constraint) {
          return SizedBox(
              width: constraint.maxWidth,
              height: 100,
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.network(
                          data.url,
                          width: 100,
                          height: 100
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 5, 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: constraint.maxWidth - 130,
                          child: Text(data.title,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                  fontSize: 15)),
                        ),
                        SizedBox(
                          width: constraint.maxWidth - 130,
                          child: Text(data.id.toString(),
                              style: GoogleFonts.poppins(
                                  color: Colors.black87, fontSize: 10)),
                        ),
                        SizedBox(
                          width: constraint.maxWidth - 130,
                          child: Row(
                            children: [
                              Container(
                                color: Colors.green.shade900,
                                padding: const EdgeInsets.all(3),
                                child: Row(
                                  children: [
                                    Text('${data.comments}',
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.poppins(
                                            color: Colors.white, fontSize: 13)),
                                    const SizedBox(width: 2),
                                    const Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 15,
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text('${data.id}',
                                  textAlign: TextAlign.end,
                                  style: GoogleFonts.poppins(
                                      color: Colors.black87, fontSize: 11))
                            ],
                          ),
                        ),
                        SizedBox(
                          width: constraint.maxWidth - 130,
                          child: Row(
                            children: [
                              Text('\$${data.draft}',
                                  style: GoogleFonts.poppins(
                                      color: Colors.green.shade800,
                                      fontSize: 13)),
                              const SizedBox(width: 8),
                              Text(data.nodeId,
                                  style: GoogleFonts.poppins(
                                      color: Colors.black87, fontSize: 10))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }

  void rebuildList() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchIssuesCubit,SearchIssuesState> (
        builder: (context, state) {
          if (state is SearchIssuesLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SearchIssuesLoadedState) {
            if (_listSearchIssues!.isEmpty) {
              _listSearchIssues = state.items;
            }
            return LayoutBuilder (
                builder: (context, constraints) {
                  if (widget.isLazyLoading) {
                    return Column (
                      children: [
                        Expanded (
                            child: ListView.builder(
                              controller: _controller,
                              itemCount: _listSearchIssues!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 10),
                                  child: ListTile(
                                    title: Text(_listSearchIssues![index].title),
                                    subtitle: Text(_listSearchIssues![index].body),
                                  ),
                                );
                              },
                            )
                        ),
                        /// when the _loadMore function is running
                        if (_isLoadMoreRunning == true) const Padding (
                          padding: EdgeInsets.only(top: 10, bottom: 40),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        /// When nothing else to load
                        if (_hasNextPage == false) Container (
                          padding: const EdgeInsets.only(top: 30, bottom: 40),
                          color: Colors.amber,
                          child: const Center(
                            child: Text('You have fetched all of the content'),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Column (
                      children: [
                        SizedBox(
                          height: constraints.maxHeight - dataPagerHeight,
                          child: loadListView(constraints),
                        ),
                        SizedBox(
                            height: dataPagerHeight,
                            child: SfDataPager(
                                pageCount: 10,
                                onPageNavigationStart: (pageIndex) {
                                  setState(() {
                                    showLoadingIndicator = true;
                                  });
                                },
                                onPageNavigationEnd: (pageIndex) {
                                  setState(() {
                                    showLoadingIndicator = false;
                                  });
                                },
                                delegate: CustomSliverChildBuilderDelegate(
                                    indexBuilder,
                                    listSearchIssues: _listSearchIssues!,
                                    paginatedIssuesData: _paginatedIssuesData,
                                    rowsPerPage: rowsPerPage
                                )..addListener(rebuildList)
                            )
                        )
                      ],
                    );
                  }
                }
            );
          } else if (state is SearchIssuesMessageState) {
            return EmptyDataWidget(
                title: "Yeay, Data Issues is Empty!",
                message: state.message,
                onPressed: () async {
                  _firstLoadSearchIssues(widget.keyword, _page);
                }, titleOnPressed: 'Refresh'
            );
          } else if (state is SearchIssuesErrorState) {
            if (state.httpStatus == '0') {
              return ErrorNetworkWidget (
                title: "Network Error",
                titleOnPressed: 'Try Again',
                message: state.message,
                onPressed: () async {
                  _firstLoadSearchIssues(widget.keyword, _page);
                },
              );
            } else {
              return ErrorNetworkWidget (
                  title: "HTTP ${state.httpStatus}",
                  titleOnPressed: 'Try Again',
                  message: state.message,
                  onPressed: () async {
                    _firstLoadSearchIssues(widget.keyword, _page);
                  }
              );
            }
          } else {
            return Container();
          }
        },
        listener: (context, state) {
          if (widget.isLazyLoading) {
            if (state is SearchIssuesLoadedState) {
              setState(() {
                _isLoadMoreRunning = false;
              });
              if (_hasNextPage == true && _isFirstLoadRunning == false && _isLoadMoreRunning == false && _controller.position.extentAfter < 300) {
                var fetchedPosts = state.items;
                if (fetchedPosts!.isNotEmpty) {
                  setState(() {
                    _listSearchIssues?.addAll(fetchedPosts);
                  });
                } else {
                  setState(() {
                    _hasNextPage = false;
                  });
                }
              } else {
                _listSearchIssues = state.items;
              }
            }
          }
        }
    );
  }

  Widget loadListView(BoxConstraints constraints) {
    List<Widget> _getChildren() {
      final List<Widget> stackChildren = [];

      if (_listSearchIssues!.isNotEmpty) {
        stackChildren.add(ListView.custom(
            childrenDelegate: CustomSliverChildBuilderDelegate(
                indexBuilder,
                listSearchIssues: [],
                paginatedIssuesData: [],
                rowsPerPage: rowsPerPage
            )));
      }

      if (showLoadingIndicator) {
        stackChildren.add(Container(
          color: Colors.black12,
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: const Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              strokeWidth: 3,
            ),
          ),
        ));
      }
      return stackChildren;
    }
    return Stack(
      children: _getChildren(),
    );
  }

}

class CustomSliverChildBuilderDelegate extends SliverChildBuilderDelegate with DataPagerDelegate, ChangeNotifier {

  List<SearchIssuesModel>? paginatedIssuesData;
  List<SearchIssuesModel>? listSearchIssues;

  int rowsPerPage;

  CustomSliverChildBuilderDelegate(builder,{
    required this.paginatedIssuesData,
    required this.listSearchIssues,
    required this.rowsPerPage
  }) : super(builder);

  @override
  int get childCount => paginatedIssuesData!.length;

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {
    int startRowIndex = newPageIndex * rowsPerPage;
    int endRowIndex = startRowIndex + rowsPerPage;

    if (endRowIndex > listSearchIssues!.length) {
      endRowIndex = listSearchIssues!.length - 1;
    }

    await Future.delayed(const Duration(milliseconds: 2000));
    paginatedIssuesData = listSearchIssues!.getRange(
        startRowIndex,
        endRowIndex).toList(growable: false);
    notifyListeners();
    return true;
  }

  @override
  bool shouldRebuild(covariant CustomSliverChildBuilderDelegate oldDelegate) {
    return true;
  }
}