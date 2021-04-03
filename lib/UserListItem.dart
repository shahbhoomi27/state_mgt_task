import 'package:flutter/material.dart';
import 'package:flutter_listview/Model/UserData.dart';
import 'package:flutter_listview/ViewModel/DataStore.dart';
import 'package:provider/provider.dart';

class UserListItem extends StatefulWidget {
  UserData userList;

  UserListItem(this.userList);

  @override
  _UserListItemState createState() => _UserListItemState();
}

class _UserListItemState extends State<UserListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        children: [
          Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage:
                        NetworkImage("${widget.userList.avatarUrl}"),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.userList.login,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          Checkbox(
              value: widget.userList.isCheck,
              onChanged: (value) {
                setState(() {
                  widget.userList.isCheck = value;

                  Provider.of<DataStore>(context, listen: false)
                      .setBookMarkedList(widget.userList, value);
                });
              }),
        ],
      ),
    );
  }
}
