import 'package:flutter/foundation.dart';
import 'package:flutter_listview/Model/UserData.dart';

class DataStore extends ChangeNotifier {
  List<UserData> userList = List<UserData>();
  List<UserData> bookMarkedList = List<UserData>();

  int get listItemCount {
    return userList.length;
  }

  void setData(List<UserData> dataList) {
    userList = dataList;
    notifyListeners();
    print("userName ::  ${userList[0].login}");
  }

  void addData(List<UserData> dataList) {
    userList.addAll(dataList);
    notifyListeners();
    print("userId last ::  ${userList.last.id}");
  }

  void refreshUser() {
    userList = List<UserData>();
    bookMarkedList = List<UserData>();
    notifyListeners();
  }

  void setBookMarkedList(UserData user, bool isChecked) {
    if (isChecked) {
      bookMarkedList.add(user);
    } else {
      for (int i = 0; i < bookMarkedList.length; i++) {
        if (bookMarkedList[i].id == user.id) {
          bookMarkedList.remove(user);
        }
      }
    }
    notifyListeners();
  }
  /*void getBookmarkedList(int index){
    for(int i=index;)
  }*/
}
