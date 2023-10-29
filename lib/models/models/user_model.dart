class UserModel {
  String? token;
  String? name;
  String? phoneNumber;
  String? fatherName;
  String? birthday;
  String? bornCity;
  String? nationalCode;
  String? nationalNumber;
  String? education;
  String? address;
  String? emergancyNumber;

  String? imageUrl;
  List<dynamic>? reservedClasses;
  List<dynamic>? reserveNurses;
  List<Message>? messages;
  String? id;

  UserModel(
      {this.token,
      this.name,
      this.phoneNumber,
      this.fatherName,
      this.birthday,
      this.bornCity,
      this.nationalCode,
      this.nationalNumber,
      this.education,
      this.address,
      this.emergancyNumber,
      this.imageUrl,
      this.reservedClasses,
      this.reserveNurses,
      this.id});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json["Token"];
    name = json["Name"];
    phoneNumber = json["PhoneNumber"];
    fatherName = json["FatherName"];
    birthday = json["Birthday"];
    bornCity = json["BornCity"];
    imageUrl = json['ImageUrl'];
    nationalCode = json["NationalCode"];
    nationalNumber = json["NationalNumber"];
    messages = json['Messages'] == null
        ? null
        : List<Message>.from(json['Messages'].map((x) => Message.fromJson(x)));
    education = json["Education"];
    address = json["Address"];
    emergancyNumber = json["EmergancyNumber"];
    reservedClasses = json["ReservedClasses"] ?? [];
    reserveNurses = json["ReserveNurses"] ?? [];
    id = json["Id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["Name"] = name;
    _data["PhoneNumber"] = phoneNumber;
    _data["FatherName"] = fatherName;
    _data["Birthday"] = birthday;
    _data["BornCity"] = bornCity;
    _data["NationalCode"] = nationalCode;
    _data["NationalNumber"] = nationalNumber;
    _data["Education"] = education;
    _data['ImageUrl'] = imageUrl;
    _data["Address"] = address;
    _data["EmergancyNumber"] = emergancyNumber;
    _data["Id"] = id;

    return _data;
  }
}

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

  Message(
      {this.content,
      this.messageType,
      this.userId,
      this.supportId,
      this.isUserSend,
      this.seen,
      this.id,
      this.createdAt,
      this.updatedAt});

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
