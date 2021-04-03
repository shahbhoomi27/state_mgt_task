import 'package:flutter/material.dart';
import 'package:flutter_listview/Model/UserData.dart';
import 'package:provider/provider.dart';

import 'UserListItem.dart';
import 'ViewModel/DataStore.dart';

class BookmarkedListPage extends StatefulWidget {
  @override
  _BookmarkedListPageState createState() => _BookmarkedListPageState();
}

class _BookmarkedListPageState extends State<BookmarkedListPage> {
  ScrollController _scrollController = ScrollController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    List<UserData> bookMarkedList =
        Provider.of<DataStore>(context, listen: false).bookMarkedList;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.builder(
          shrinkWrap: true,
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          itemCount: bookMarkedList.length,
          itemBuilder: (context, index) {
            return UserListItem(bookMarkedList[index]);
          }),
    );
  }
}
