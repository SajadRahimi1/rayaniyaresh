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
