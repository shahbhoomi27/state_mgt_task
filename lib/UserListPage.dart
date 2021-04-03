import 'package:flutter/material.dart';
import 'package:flutter_listview/Model/UserData.dart';
import 'package:provider/provider.dart';

import 'UserListItem.dart';
import 'ViewModel/DataStore.dart';

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage>
    with AutomaticKeepAliveClientMixin {
  ScrollController _scrollController = ScrollController();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getAllData(0);
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.position.pixels) {
        getAllData(
            Provider.of<DataStore>(context, listen: false).userList.last.id);
        // Perform event when user reach at the end of list (e.g. do Api call)
      }
    });
  }

  Future<List<UserData>> getAllData(int id) async {
    if (!isLoading) {
      isLoading = true;
    }
    UserData userData = UserData();
    // List<UserData> userList = await
    userData.getUserList(id).then((userList) {
      Provider.of<DataStore>(context, listen: false).addData(userList);
      isLoading = false;
    });
  }

  Future<void> getUserList() async {
    setState(() {
      Provider.of<DataStore>(context, listen: false).refreshUser();
      getAllData(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Consumer<DataStore>(
        builder: (context, userData, child) {
          if (isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return RefreshIndicator(
            onRefresh: getUserList,
            child: ListView.builder(
                shrinkWrap: true,
                controller: _scrollController,
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemCount: userData.userList.length,
                itemBuilder: (context, index) {
                  return UserListItem(userData.userList[index]);
                }),
          );
        },
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
