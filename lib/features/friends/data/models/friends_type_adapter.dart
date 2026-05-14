import 'package:chat_box/features/friends/data/models/friends.dart';
import 'package:hive/hive.dart';

class FriendsTypeAdapter extends TypeAdapter<Friends> {
  @override
  Friends read(BinaryReader reader) {
    return Friends(
      dataListList: reader.readList().cast<DataList>(),
    );
  }

  @override
  int get typeId => 4;

  @override
  void write(BinaryWriter writer, Friends obj) {
    writer.writeList(obj.dataListList ?? []);
  }
}

class FriendTypeAdapter extends TypeAdapter<DataList> {
  @override
  DataList read(BinaryReader reader) {
    return DataList(profilePicture: reader.readString(),fullName: reader.readString(),username: reader.readString(),id: reader.readString());
  }

  @override
  int get typeId => 5;

  @override
  void write(BinaryWriter writer, DataList obj) {
    writer.writeString(obj.profilePicture ?? "");
    writer.writeString(obj.fullName ?? "");
    writer.writeString(obj.username ?? "");
    writer.writeString(obj.id ?? "");
  }
}
