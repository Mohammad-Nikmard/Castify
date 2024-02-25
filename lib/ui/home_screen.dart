import 'package:castify/constants/constants.dart';
import 'package:castify/ui/tab_bar_screens/all_screen.dart';
import 'package:castify/ui/tab_bar_screens/book_screen.dart';
import 'package:castify/ui/tab_bar_screens/fav_screen.dart';
import 'package:castify/ui/tab_bar_screens/podcast_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController? _controller;
  @override
  void initState() {
    _controller = TabController(length: 4, vsync: this);
    _controller!.index = 3;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      backgroundColor: MyColor.midWhiteColor,
      body: NestedScrollView(
        headerSliverBuilder: (context, isscrolled) {
          return [
            SliverPersistentHeader(
              delegate: TabBarDelegate(
                TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  controller: _controller,
                  labelColor: MyColor.whiteColor,
                  unselectedLabelColor: MyColor.greyColor,
                  labelStyle: TextStyle(fontSize: 14, fontFamily: "SM"),
                  indicatorColor: MyColor.orangeColor,
                  indicator: BoxDecoration(
                    color: MyColor.orangeColor,
                    borderRadius: BorderRadius.circular(23),
                  ),
                  tabs: [
                    Tab(
                      text: "موردعلاقه",
                    ),
                    Tab(
                      text: "پادکست",
                    ),
                    Tab(
                      text: "کتاب",
                    ),
                    Tab(
                      text: "همه",
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 16),
            ),
          ];
        },
        body: TabBarView(
          controller: _controller,
          children: [
            FavoriteWidget(),
            PodcastsWidget(),
            BooksWidget(),
            AllWidget(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _getAppBar() {
    return AppBar(
      title: Text(
        "کستیفای",
        style: TextStyle(
            fontFamily: "MR", color: MyColor.orangeColor, fontSize: 24),
      ),
      centerTitle: true,
      scrolledUnderElevation: 0.0,
      leading: Image.asset("images/icon_notification.png"),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Image.asset("images/icon_search.png"),
        ),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}

class TabBarDelegate extends SliverPersistentHeaderDelegate {
  TabBar _tabBar;
  TabBarDelegate(this._tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: MyColor.midWhiteColor,
      height: 46,
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
