class CreateNurseModel {
  String? name;
  String? fatherName;
  String? birthday;
  String? bornCity;
  String? nationalCode;
  String? nationalNumber;
  String? education;
  String? address;
  String? phoneNumber;
  String? homeNumber;
  bool? specialCare;
  String? otherProp;
  int? formCode;
  String? nurseCategory;
  String? picture;

  CreateNurseModel(
      {this.name,
      this.fatherName,
      this.birthday,
      this.bornCity,
      this.nationalCode,
      this.nationalNumber,
      this.education,
      this.address,
      this.phoneNumber,
      this.homeNumber,
      this.specialCare,
      this.picture,
      this.formCode,
      this.otherProp,
      this.nurseCategory});

  CreateNurseModel.fromJson(Map<String, dynamic> json) {
    name = json["Name"];
    fatherName = json["FatherName"];
    birthday = json["Birthday"];
    bornCity = json["BornCity"];
    nationalCode = json["NationalCode"];
    nationalNumber = json["NationalNumber"];
    education = json["Education"];
    address = json["Address"];
    formCode = json['formCode'];
    phoneNumber = json["PhoneNumber"];
    picture =
        json['NurseImages'] == null ? null : json['NurseImages']['Picture'];
    homeNumber = json["HomeNumber"];
    specialCare = json["SpecialCare"];
    otherProp = json["OtherProp"];
    nurseCategory = json["NurseCategory"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["fatherName"] = fatherName;
    _data["birthday"] = birthday;
    _data["bornCity"] = bornCity;
    _data["nationalCode"] = nationalCode;
    _data["nationalNumber"] = nationalNumber;
    _data["education"] = education;
    _data["address"] = address;
    _data["phoneNumber"] = phoneNumber;
    _data["homeNumber"] = homeNumber;
    _data["specialCare"] = specialCare;
    _data["otherProp"] = otherProp;
    _data["nurseCategory"] = nurseCategory;
    return _data;
  }
}
