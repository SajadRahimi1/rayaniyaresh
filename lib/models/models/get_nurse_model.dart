class GetNurseModel {
  String? name;
  String? fatherName;
  String? birthday;
  String? bornCity;
  String? nationalCode;
  String? nationalNumber;
  String? education;
  int? formCode;
  String? address;
  String? phoneNumber;
  String? homeNumber;
  String? shift;
  bool? specialCare;
  String? husbandPhoneNumber;
  String? childPhoneNumber;
  String? parentPhoneNumber;
  String? pdfLink;
  String? authority;
  String? otherProp;
  int? guarantee;
  int? status;
  dynamic nurseImages;
  List<dynamic>? nurseFamily;
  String? nurseCategory;
  List<dynamic>? reserveNurses;
  String? id;
  String? createdAt;
  String? updatedAt;

  GetNurseModel(
      {this.name,
      this.fatherName,
      this.birthday,
      this.bornCity,
      this.nationalCode,
      this.nationalNumber,
      this.education,
      this.formCode,
      this.address,
      this.phoneNumber,
      this.homeNumber,
      this.shift,
      this.specialCare,
      this.husbandPhoneNumber,
      this.childPhoneNumber,
      this.parentPhoneNumber,
      this.pdfLink,
      this.authority,
      this.otherProp,
      this.guarantee,
      this.status,
      this.nurseImages,
      this.nurseFamily,
      this.nurseCategory,
      this.reserveNurses,
      this.id,
      this.createdAt,
      this.updatedAt});

  GetNurseModel.fromJson(Map<String, dynamic> json) {
    name = json["Name"];
    fatherName = json["FatherName"];
    birthday = json["Birthday"];
    bornCity = json["BornCity"];
    nationalCode = json["NationalCode"];
    nationalNumber = json["NationalNumber"];
    education = json["Education"];
    formCode = json["formCode"];
    address = json["Address"];
    phoneNumber = json["PhoneNumber"];
    homeNumber = json["HomeNumber"];
    shift = json["Shift"];
    specialCare = json["SpecialCare"];
    husbandPhoneNumber = json["HusbandPhoneNumber"];
    childPhoneNumber = json["ChildPhoneNumber"];
    parentPhoneNumber = json["ParentPhoneNumber"];
    pdfLink = json["pdfLink"];
    authority = json["authority"];
    otherProp = json["OtherProp"];
    guarantee = json["Guarantee"];
    status = json["status"];
    nurseImages = json["NurseImages"];
    nurseFamily = json["NurseFamily"] ?? [];
    nurseCategory = json["NurseCategory"];
    reserveNurses = json["ReserveNurses"] ?? [];
    id = json["Id"];
    createdAt = json["CreatedAt"];
    updatedAt = json["UpdatedAt"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["Name"] = name;
    _data["FatherName"] = fatherName;
    _data["Birthday"] = birthday;
    _data["BornCity"] = bornCity;
    _data["NationalCode"] = nationalCode;
    _data["NationalNumber"] = nationalNumber;
    _data["Education"] = education;
    _data["formCode"] = formCode;
    _data["Address"] = address;
    _data["PhoneNumber"] = phoneNumber;
    _data["HomeNumber"] = homeNumber;
    _data["Shift"] = shift;
    _data["SpecialCare"] = specialCare;
    _data["HusbandPhoneNumber"] = husbandPhoneNumber;
    _data["ChildPhoneNumber"] = childPhoneNumber;
    _data["ParentPhoneNumber"] = parentPhoneNumber;
    _data["pdfLink"] = pdfLink;
    _data["authority"] = authority;
    _data["OtherProp"] = otherProp;
    _data["Guarantee"] = guarantee;
    _data["status"] = status;
    _data["NurseImages"] = nurseImages;
    if (nurseFamily != null) {
      _data["NurseFamily"] = nurseFamily;
    }
    _data["NurseCategory"] = nurseCategory;
    if (reserveNurses != null) {
      _data["ReserveNurses"] = reserveNurses;
    }
    _data["Id"] = id;
    _data["CreatedAt"] = createdAt;
    _data["UpdatedAt"] = updatedAt;
    return _data;
  }
}
