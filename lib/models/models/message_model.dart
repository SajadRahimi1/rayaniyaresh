class MessageModel {
  String? content;
  String? messageType;
  dynamic supportId;
  bool? isUserSend;
  bool? seen;
  bool? isSent;
  bool? success;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;

  MessageModel(
      {this.content,
      this.messageType,
      this.supportId,
      this.isUserSend,
      this.seen,
      this.id,
      this.success = true,
      this.isSent=true,
      this.createdAt,
      this.updatedAt});

  MessageModel.fromJson(Map<String, dynamic> json) {
    content = json["Content"];
    messageType = json["MessageType"];
    supportId = json["SupportId"];
    isUserSend = json["IsUserSend"];
    seen = json["Seen"];
    id = json["Id"];
    createdAt =
        json["CreatedAt"] == null ? null : DateTime.parse(json["CreatedAt"]);
    updatedAt =
        json["UpdatedAt"] == null ? null : DateTime.parse(json["UpdatedAt"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["Content"] = content;
    _data["MessageType"] = messageType;
    _data["SupportId"] = supportId;
    _data["IsUserSend"] = isUserSend;
    _data["Seen"] = seen;
    _data["Id"] = id;
    _data["CreatedAt"] = createdAt;
    _data["UpdatedAt"] = updatedAt;
    return _data;
  }
}
