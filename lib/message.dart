
class Message {
  String? content;
  String? messageType;
  String? userId;
  dynamic supportId;
  bool? isUserSend;
  bool? seen;
  String? id;
  String? createdAt;
  String? updatedAt;

  Message({this.content, this.messageType, this.userId, this.supportId, this.isUserSend, this.seen, this.id, this.createdAt, this.updatedAt});

  Message.fromJson(Map<String, dynamic> json) {
    content = json["Content"];
    messageType = json["MessageType"];
    userId = json["UserId"];
    supportId = json["SupportId"];
    isUserSend = json["IsUserSend"];
    seen = json["Seen"];
    id = json["Id"];
    createdAt = json["CreatedAt"];
    updatedAt = json["UpdatedAt"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["Content"] = content;
    _data["MessageType"] = messageType;
    _data["UserId"] = userId;
    _data["SupportId"] = supportId;
    _data["IsUserSend"] = isUserSend;
    _data["Seen"] = seen;
    _data["Id"] = id;
    _data["CreatedAt"] = createdAt;
    _data["UpdatedAt"] = updatedAt;
    return _data;
  }
}