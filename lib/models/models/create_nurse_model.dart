
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
  String? nurseCategory;

  CreateNurseModel({this.name, this.fatherName, this.birthday, this.bornCity, this.nationalCode, this.nationalNumber, this.education, this.address, this.phoneNumber, this.homeNumber, this.specialCare, this.otherProp, this.nurseCategory});

  CreateNurseModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    fatherName = json["fatherName"];
    birthday = json["birthday"];
    bornCity = json["bornCity"];
    nationalCode = json["nationalCode"];
    nationalNumber = json["nationalNumber"];
    education = json["education"];
    address = json["address"];
    phoneNumber = json["phoneNumber"];
    homeNumber = json["homeNumber"];
    specialCare = json["specialCare"];
    otherProp = json["otherProp"];
    nurseCategory = json["nurseCategory"];
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