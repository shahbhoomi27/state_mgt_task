import 'package:flutter/material.dart';
import 'package:flutter_listview/BookmarkedListPage.dart';
import 'package:flutter_listview/UserListPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            xTabBar(),
            xTabBarView(),
          ],
        ),
      ),
    );
  }

  Widget xTabBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey)),
        ),
        child: TabBar(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 1,
          labelPadding: EdgeInsets.all(12),
          tabs: [
            Text(
              "Users",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Bookmarked Users",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget xTabBarView() {
    return Expanded(
      child: TabBarView(
          controller: _tabController,
          physics: BouncingScrollPhysics(),
          children: [
            UserListPage(),
            BookmarkedListPage(),
          ]),
    );
  }
}
