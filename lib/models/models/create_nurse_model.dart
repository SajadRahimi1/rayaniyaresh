import 'package:rayaniyaresh/models/extensions/enum_extension.dart';
import 'package:rayaniyaresh/models/models/request_nurse_model.dart';

class CreateNurseModel {
  String? name;
  String? id;
  String? fatherName;
  String? birthday;
  String? bornCity;
  String? nationalCode;
  String? nationalNumber;
  String? education;
  String? address;
  String? phoneNumber;
  String? homeNumber;
  String? shift;
  bool? specialCare;
  String? province;
  String? city;
  String? unit;
  String? neighborhood;
  String? street;
  List<Shift>? shifts;
  List<OtherProps>? otherProps;
  List<NurseCategory>? nurseCategories;
  String? alley;
  String? postalCode;
  String? otherProp;
  int? formCode;
  String? nurseCategory;
  String? picture;

  CreateNurseModel({
    this.name,
    this.fatherName,
    this.birthday,
    this.bornCity,
    this.id,
    this.nationalCode,
    this.shifts,
    this.nationalNumber,
    this.otherProps,
    this.nurseCategories,
    this.education,
    this.address,
    this.phoneNumber,
    this.homeNumber,
    this.shift,
    this.specialCare,
    this.picture,
    this.formCode,
    this.otherProp,
    this.nurseCategory,
    this.alley,
    this.city,
    this.neighborhood,
    this.postalCode,
    this.province,
    this.street,
  });

  CreateNurseModel.fromJson(Map<String, dynamic> json) {
    name = json["Name"];
    fatherName = json["FatherName"];
    id = json['id'];
    birthday = json["Birthday"];
    bornCity = json["BornCity"];
    nationalCode = json["NationalCode"];
    nationalNumber = json["NationalNumber"];
    education = json["Education"];
    address = json["Address"];
    formCode = json['formCode'];
    shift = json['Shift'];
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
    _data["shift"] = shift;
    _data["phoneNumber"] = phoneNumber;
    _data["homeNumber"] = homeNumber ?? "";
    _data["specialCare"] = specialCare;
    _data["otherProp"] = otherProp;
    _data["otherProps"] = otherProps.toMap();
    _data["province"] = province;
    _data["city"] = city;
    _data["neighborhood"] = neighborhood;
    _data["street"] = street;
    _data["alley"] = alley;
    _data["unit"] = unit;
    _data["postalCode"] = postalCode;
    _data["nurseCategories"] = nurseCategories.toMap();
    _data["shifts"] = shifts.toMap();
    // _data["nurseCategory"] = nurseCategory.toString();
    return _data;
  }
}

enum OtherProps {
  drug,
  smoke,
  alcoholic,
  disability,
  criminal,
  specialDisease,
  family,
  specializedDegree
}
