class Message {
  Message({
    String? mediaType,
    String? id,
    String? senderId,
    String? receiverId,
    String? message,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) {
    _mediaType = mediaType;
    _id = id;
    _senderId = senderId;
    _receiverId = receiverId;
    _message = message;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  Message.fromJson(dynamic json) {
    _mediaType = json['mediaType'];
    _id = json['_id'];
    _senderId = json['senderId'];
    _receiverId = json['receiverId'];
    _message = json['message'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _mediaType;
  String? _id;
  String? _senderId;
  String? _receiverId;
  String? _message;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
  Message copyWith({
    String? mediaType,
    String? id,
    String? senderId,
    String? receiverId,
    String? message,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) => Message(
    mediaType: mediaType ?? _mediaType,
    id: id ?? _id,
    senderId: senderId ?? _senderId,
    receiverId: receiverId ?? _receiverId,
    message: message ?? _message,
    createdAt: createdAt ?? _createdAt,
    updatedAt: updatedAt ?? _updatedAt,
    v: v ?? _v,
  );
  String? get mediaType => _mediaType;
  String? get id => _id;
  String? get senderId => _senderId;
  String? get receiverId => _receiverId;
  String? get message => _message;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mediaType'] = _mediaType;
    map['_id'] = _id;
    map['senderId'] = _senderId;
    map['receiverId'] = _receiverId;
    map['message'] = _message;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }
}

class Messages {
  List<Message>? messages;

  Messages({this.messages});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (messages != null) {
      map["messages"] = messages?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  Messages.fromJson(dynamic json) {
    if (json != null) {
      messages = [];
      json.forEach((v) {
        messages?.add(Message.fromJson(v));
      });
    }
  }
}
