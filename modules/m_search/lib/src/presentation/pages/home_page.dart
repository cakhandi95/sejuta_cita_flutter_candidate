import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_core/m_core.dart';

///
/// Created by Handy on 24/07/22
/// HP Pro Book 430 G1 
/// Email : it.handy@borwita.co.id
///

class HomePage extends StatefulWidget {

  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // At the beginning, we fetch the first 20 posts
  int _page = 0;
  // you can change this value to fetch more or less posts per page (10, 15, 5, etc)
  final int _limit = 20;

  // There is next page or not
  bool _hasNextPage = true;

  // Used to display loading indicators when _firstLoad function is running
  bool _isFirstLoadRunning = false;

  // Used to display loading indicators when _loadMore function is running
  bool _isLoadMoreRunning = false;

  String radioButtonItem = 'User';
  int id = 1;
  TextEditingController searchHistoryController = TextEditingController();

  late List<String> _choices;
  late int _defaultChoiceIndex;
  late bool _lazyLoading;

  late List<SearchRepoModel> _listSearchRepo;
  late List<SearchIssuesModel> _listSearchIssues;
  late List<SearchUsersModel> _listSearchUsers;

  late ScrollController _searchUsernameController;
  late ScrollController _searchIssuesController;
  late ScrollController _searchRepoController;

  @override
  void initState() {
    super.initState();
    _defaultChoiceIndex = 0;
    _choices = [
      'Lazy Loading',
      'With Index'
    ];
    _lazyLoading = false;
    _listSearchRepo = [];
    _listSearchIssues = [];
    _listSearchUsers = [];
    _searchUsernameController = ScrollController()..addListener(_loadMoreSearchUsername);
    _searchIssuesController = ScrollController()..addListener(_loadMoreSearchUsername);
    _searchRepoController = ScrollController()..addListener(_loadMoreSearchUsername);
  }

  @override
  void dispose() {
    _searchUsernameController.removeListener(_loadMoreSearchUsername);
    _searchIssuesController.removeListener(_loadMoreSearchUsername);
    _searchRepoController.removeListener(_loadMoreSearchUsername);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: CustomScrollView(
        shrinkWrap: Platform.isIOS ? false : true,
        slivers: [
          // TODO HANDY : Sliver - AppBarDelegate (This will remain hidden)
          SliverPersistentHeader(
            floating: true,
            delegate: SliverAppBarDelegate(
              minHeight: 50,
              maxHeight: 55,
              child: Container (
                color: Colors.white,
                margin: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                child: TextField(
                  controller: searchHistoryController,
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        child: SvgPicture.asset(
                          Assets.searchHistorySVG,
                          color: colorBlackPrimary,
                          width: 10,
                          height: 10,
                        ),
                      ),
                      hintText: 'Pencarian',
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 10.75,
                        fontWeight: FontWeight.w400,
                        color: colorDarkGreySubtitle,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(color: colorLineStroke, width: 1),
                      )
                  ),
                  onChanged: (String text) {
                    //   onSearchTextChanged(text);
                  },
                ),
              ),
            ),
          ),
          choiceTypeGithub(context),
          choiceTypeList(context),
          SliverToBoxAdapter (
            child: Container (
              height: 20.5,
              color: Colors.white,
            ),
          ),
          itemsIsLazyLoading(context,_lazyLoading),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<void> _firstLoadSearchUsername(String keyword, int? pages) async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    Future.microtask(() => {
      BlocProvider.of<SearchUsersCubit>(context).get(keyword, pages),
    });
  }

  Future<void> _loadMoreSearchUsername() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _searchUsernameController.position.extentAfter < 300) {

    }
  }



  Future<void> _loadMoreSearchIssues() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _searchIssuesController.position.extentAfter < 300) {

    }
  }

  Future<void> _firstLoadSearchRepo(String keyword, int? pages) async {
    Future.microtask(() => {
      BlocProvider.of<SearchRepoCubit>(context).get(keyword, pages),
    });
  }

  Future<void> _loadMoreSearchRepo() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _searchRepoController.position.extentAfter < 300) {

    }
  }

  Widget itemsUsernameGithub(BuildContext context, SearchUsersModel usersModel) {
    return Container();
  }

  Widget _itemsIssuesGithub(BuildContext context, SearchIssuesModel issuesModel) {
    return Container();
  }

  Widget _itemsRepoGithub(BuildContext context, SearchRepoModel repoModel) {
    return Container();
  }

  Widget choiceTypeGithub(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverAppBarDelegate(
          minHeight: 45.0,
          maxHeight: 50.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              Radio(
                value: 1,
                groupValue: id,
                onChanged: (val) {
                  setState(() {
                    radioButtonItem = 'User';
                    id = 1;
                  });
                },
              ),
              Text(
                'User',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: colorDarkGreySubtitle,
                ),
              ),
              Radio(
                value: 2,
                groupValue: id,
                onChanged: (val) {
                  setState(() {
                    radioButtonItem = 'Issues';
                    id = 2;
                  });
                },
              ),
              Text(
                'Issues',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: colorDarkGreySubtitle,
                ),
              ),
              Radio(
                value: 3,
                groupValue: id,
                onChanged: (val) {
                  setState(() {
                    radioButtonItem = 'Repositories';
                    id = 3;
                  });
                },
              ),
              Text(
                'Repositories',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: colorDarkGreySubtitle,
                ),
              ),
            ],
          )
      ),
    );
  }

  Widget choiceTypeList(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverAppBarDelegate(
          minHeight: 45.0,
          maxHeight: 50.0,
          child: ListView.builder(
              itemCount: _choices.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return ChoiceChip(
                  label: Text(_choices[index]),
                  selected: _defaultChoiceIndex == index,
                  selectedColor: Colors.green,
                  onSelected: (bool selected) {
                    setState(() {
                      _defaultChoiceIndex = selected ? index : 0;
                    });
                  },
                  backgroundColor: Colors.blue,
                  labelStyle: GoogleFonts.poppins(
                    fontSize: 10.75,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                );
              }
          )
      ),
    );
  }

  Widget itemsIsLazyLoading(BuildContext context,bool isLazyLoading) {
    if (isLazyLoading) {
      if(radioButtonItem == 'Users') {
        if(_isFirstLoadRunning) {
          return const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ));
        } else {
          return SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return itemsUsernameGithub(context, _listSearchUsers[index]);
              }, childCount: _listSearchRepo.length));
        }

      } else if (radioButtonItem == 'issues') {
        return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return _itemsIssuesGithub(context, _listSearchIssues[index]);
            }, childCount: _listSearchIssues.length));
      } else if (radioButtonItem == 'repositories') {
        return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return _itemsRepoGithub(context, _listSearchRepo[index]);
            }, childCount: _listSearchRepo.length));
      }
    } else {

    }
    return Container();
  }
}

