class DataList {
  String? id;
  String? fullName;
  String? username;
  String? profilePic;

  DataList({this.id, this.fullName, this.username, this.profilePic});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["_id"] = id;
    map["fullName"] = fullName;
    map["username"] = username;
    map["profilePic"] = profilePic;
    return map;
  }

  DataList.fromJson(dynamic json){
    id = json["_id"];
    fullName = json["fullName"];
    username = json["username"];
    profilePic = json["profilePic"];
  }
}

class FriendRequests {
  List<DataList>? dataListList;

  FriendRequests({this.dataListList});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (dataListList != null) {
      map["dataList"] = dataListList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  FriendRequests.fromJson(dynamic json){
    if (json != null) {
      dataListList = [];
      json.forEach((v) {
        dataListList?.add(DataList.fromJson(v));
      });
    }
  }
}