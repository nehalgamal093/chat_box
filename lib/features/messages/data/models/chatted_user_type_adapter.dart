import 'package:chat_box/features/messages/data/models/chatted_users.dart';
import 'package:hive/hive.dart';

class ChattedUserTypeAdapter extends TypeAdapter<ChattedUsers> {
  @override
  ChattedUsers read(BinaryReader reader) {
    return ChattedUsers(
      dataListList: reader.readList().cast<DataList>(),
    );
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, ChattedUsers obj) {
    writer.writeList(obj.dataListList ?? []);
  }
}

class UserTypeAdapter extends TypeAdapter<User> {
  @override
  User read(BinaryReader reader) {
    return User(
      id: reader.readString(),
      fullName: reader.readString(),
      profilePicture: reader.readString(),
      updatedAt: reader.readString(),
    );
  }

  @override
  int get typeId => 1;

  @override
  void write(BinaryWriter writer, User obj) {
    writer.writeString(obj.id ?? '');
    writer.writeString(obj.fullName ?? '');
    writer.writeString(obj.profilePicture ?? '');
    writer.writeString(obj.updatedAt ?? '');
  }

}
class LastMessageTypeAdapter extends TypeAdapter<LastMessage> {
  @override
  LastMessage read(BinaryReader reader) {
    return LastMessage(
      id: reader.readString(),
      message: reader.readString(),
    );
  }

  @override
  int get typeId => 2;

  @override
  void write(BinaryWriter writer, LastMessage obj) {
    writer.writeString(obj.id ?? '');
    writer.writeString(obj.message ?? '');
  }


}

class DataListTypeAdapter extends TypeAdapter<DataList> {
  @override
  DataList read(BinaryReader reader) {
    return DataList(
      user: reader.read() as User?,
      lastMessage: reader.read() as LastMessage?,
    );
  }

  @override
  int get typeId => 3;

  @override
  void write(BinaryWriter writer, DataList obj) {
    writer.write(obj.user);
    writer.write(obj.lastMessage);
  }

}