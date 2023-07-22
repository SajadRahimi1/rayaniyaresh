import 'package:rayaniyaresh/models/models/request_nurse_model.dart';

class ReservedModel {
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
  dynamic code;
  dynamic imageUrl;
  List<ReservedClasses>? reservedClasses;
  List<RequestNurseModel>? reserveNurses;
  List<dynamic>? messages;
  String? id;
  String? createdAt;
  String? updatedAt;

  ReservedModel(
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
      this.code,
      this.imageUrl,
      this.reservedClasses,
      this.reserveNurses,
      this.messages,
      this.id,
      this.createdAt,
      this.updatedAt});

  ReservedModel.fromJson(Map<String, dynamic> json) {
    token = json["Token"];
    name = json["Name"];
    phoneNumber = json["PhoneNumber"];
    fatherName = json["FatherName"];
    birthday = json["Birthday"];
    bornCity = json["BornCity"];
    nationalCode = json["NationalCode"];
    nationalNumber = json["NationalNumber"];
    education = json["Education"];
    address = json["Address"];
    emergancyNumber = json["EmergancyNumber"];
    code = json["code"];
    imageUrl = json["ImageUrl"];
    reservedClasses = json["ReservedClasses"] == null
        ? null
        : (json["ReservedClasses"] as List)
            .map((e) => ReservedClasses.fromJson(e))
            .toList();
    reserveNurses = json["ReserveNurses"] == null
        ? null
        : (json["ReserveNurses"] as List)
            .map((e) => RequestNurseModel.fromJson(e))
            .toList();
    messages = json["Messages"] ?? [];
    id = json["Id"];
    createdAt = json["CreatedAt"];
    updatedAt = json["UpdatedAt"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["Token"] = token;
    _data["Name"] = name;
    _data["PhoneNumber"] = phoneNumber;
    _data["FatherName"] = fatherName;
    _data["Birthday"] = birthday;
    _data["BornCity"] = bornCity;
    _data["NationalCode"] = nationalCode;
    _data["NationalNumber"] = nationalNumber;
    _data["Education"] = education;
    _data["Address"] = address;
    _data["EmergancyNumber"] = emergancyNumber;
    _data["code"] = code;
    _data["ImageUrl"] = imageUrl;
    if (reservedClasses != null) {
      _data["ReservedClasses"] =
          reservedClasses?.map((e) => e.toJson()).toList();
    }
    if (messages != null) {
      _data["Messages"] = messages;
    }
    _data["Id"] = id;
    _data["CreatedAt"] = createdAt;
    _data["UpdatedAt"] = updatedAt;
    return _data;
  }
}

class Nurse {
  String? name;
  String? locations;
  String? about;
  String? days;
  dynamic image;
  double? rating;
  List<dynamic>? reserveNurses;
  String? id;
  String? createdAt;
  String? updatedAt;

  Nurse(
      {this.name,
      this.locations,
      this.about,
      this.days,
      this.image,
      this.rating,
      this.reserveNurses,
      this.id,
      this.createdAt,
      this.updatedAt});

  Nurse.fromJson(Map<String, dynamic> json) {
    name = json["Name"];
    locations = json["Locations"];
    about = json["About"];
    days = json["Days"];
    image = json["Image"];
    rating = json["Rating"];
    reserveNurses = json["ReserveNurses"] ?? [];
    id = json["Id"];
    createdAt = json["CreatedAt"];
    updatedAt = json["UpdatedAt"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["Name"] = name;
    _data["Locations"] = locations;
    _data["About"] = about;
    _data["Days"] = days;
    _data["Image"] = image;
    _data["Rating"] = rating;
    if (reserveNurses != null) {
      _data["ReserveNurses"] = reserveNurses;
    }
    _data["Id"] = id;
    _data["CreatedAt"] = createdAt;
    _data["UpdatedAt"] = updatedAt;
    return _data;
  }
}

class ReservedClasses {
  ClassCategory? classCategory;
  String? classCategoryId;
  String? userId;
  String? day;
  String? hours;
  bool? isInstallment;
  String? id;
  String? createdAt;
  String? updatedAt;

  ReservedClasses(
      {this.classCategory,
      this.classCategoryId,
      this.userId,
      this.day,
      this.hours,
      this.isInstallment,
      this.id,
      this.createdAt,
      this.updatedAt});

  ReservedClasses.fromJson(Map<String, dynamic> json) {
    classCategory = json["ClassCategory"] == null
        ? null
        : ClassCategory.fromJson(json["ClassCategory"]);
    classCategoryId = json["ClassCategoryId"];
    userId = json["UserId"];
    day = json["Day"];
    hours = json["Hours"];
    isInstallment = json["IsInstallment"];
    id = json["Id"];
    createdAt = json["CreatedAt"];
    updatedAt = json["UpdatedAt"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (classCategory != null) {
      _data["ClassCategory"] = classCategory?.toJson();
    }
    _data["ClassCategoryId"] = classCategoryId;
    _data["UserId"] = userId;
    _data["Day"] = day;
    _data["Hours"] = hours;
    _data["IsInstallment"] = isInstallment;
    _data["Id"] = id;
    _data["CreatedAt"] = createdAt;
    _data["UpdatedAt"] = updatedAt;
    return _data;
  }
}

class ClassCategory {
  String? classId;
  String? title;
  String? hours;
  String? days;
  String? totallHours;
  String? timeHolding;
  String? price;
  String? prePaid;
  int? installmentNumber;
  String? installmentPrice;
  String? id;
  String? createdAt;
  String? updatedAt;

  ClassCategory(
      {this.classId,
      this.title,
      this.hours,
      this.days,
      this.totallHours,
      this.timeHolding,
      this.price,
      this.prePaid,
      this.installmentNumber,
      this.installmentPrice,
      this.id,
      this.createdAt,
      this.updatedAt});

  ClassCategory.fromJson(Map<String, dynamic> json) {
    classId = json["ClassId"];
    title = json["Title"];
    hours = json["Hours"];
    days = json["Days"];
    totallHours = json["TotallHours"];
    timeHolding = json["TimeHolding"];
    price = json["Price"];
    prePaid = json["PrePaid"];
    installmentNumber = json["InstallmentNumber"];
    installmentPrice = json["InstallmentPrice"];
    id = json["Id"];
    createdAt = json["CreatedAt"];
    updatedAt = json["UpdatedAt"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["ClassId"] = classId;
    _data["Title"] = title;
    _data["Hours"] = hours;
    _data["Days"] = days;
    _data["TotallHours"] = totallHours;
    _data["TimeHolding"] = timeHolding;
    _data["Price"] = price;
    _data["PrePaid"] = prePaid;
    _data["InstallmentNumber"] = installmentNumber;
    _data["InstallmentPrice"] = installmentPrice;
    _data["Id"] = id;
    _data["CreatedAt"] = createdAt;
    _data["UpdatedAt"] = updatedAt;
    return _data;
  }
}
