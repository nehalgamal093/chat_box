class DataList {
  String? id;
  String? fullName;
  String? username;
  String? profilePicture;
  String? status;

  DataList({this.id, this.fullName, this.username, this.profilePicture,this.status});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["_id"] = id;
    map["fullName"] = fullName;
    map["username"] = username;
    map["profilePicture"] = profilePicture;
    return map;
  }

  DataList.fromJson(dynamic json){
    id = json["_id"];
    fullName = json["fullName"];
    username = json["username"];
    profilePicture = json["profilePicture"];
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