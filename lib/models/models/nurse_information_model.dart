class NurseInformationModel {
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
  dynamic otherProp;
  int? guarantee;
  NurseImages? nurseImages;
  List<NurseFamily>? nurseFamily;
  String? nurseCategory;
  List<dynamic>? reserveNurses;
  String? id;
  int? status;
  String? createdAt;
  String? updatedAt;

  NurseInformationModel(
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
      this.nurseImages,
      this.nurseFamily,
      this.nurseCategory,
      this.reserveNurses,
      this.id,
      this.createdAt,
      this.updatedAt});

  NurseInformationModel.fromJson(Map<String, dynamic> json) {
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
    specialCare = json["SpecialCare"];
    status = json['status'];
    shift = json['Shift'];
    husbandPhoneNumber = json["HusbandPhoneNumber"];
    childPhoneNumber = json["ChildPhoneNumber"];
    parentPhoneNumber = json["ParentPhoneNumber"];
    pdfLink = json["pdfLink"];
    authority = json["authority"];
    otherProp = json["OtherProp"];
    guarantee = json["Guarantee"];
    nurseImages = json["NurseImages"] == null
        ? null
        : NurseImages.fromJson(json["NurseImages"]);
    nurseFamily = json["NurseFamily"] == null
        ? null
        : (json["NurseFamily"] as List)
            .map((e) => NurseFamily.fromJson(e))
            .toList();
    nurseCategory = json["NurseCategory"];
    reserveNurses = json["ReserveNurses"] ?? [];
    id = json["Id"];
    createdAt = json["CreatedAt"];
    updatedAt = json["UpdatedAt"];
  }
// {"errors":{"Shift":["The Shift field is required."],"status":["The status field is required."],"OtherProp":["The OtherProp field is required."],"HomeNumber":["The HomeNumber field is required."]},"type":"https://tools.ietf.org/html/rfc7231#section-6.5.1","title":"One or more validation errors occurred.","status":400,"traceId":"00-5b937c84a9621114feba3a2dcdf48821-12f03955218ab35e-00"}
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Name"] = name;
    data["FatherName"] = fatherName;
    data["Birthday"] = birthday;
    data["BornCity"] = bornCity;
    data["NationalCode"] = nationalCode;
    data["NationalNumber"] = nationalNumber;
    data["Education"] = education;
    data["formCode"] = formCode;
    data["Address"] = address;
    data["PhoneNumber"] = phoneNumber;
    data["HomeNumber"] = homeNumber;
    data["SpecialCare"] = specialCare;
    data["HusbandPhoneNumber"] = husbandPhoneNumber;
    data["ChildPhoneNumber"] = childPhoneNumber;
    data["ParentPhoneNumber"] = parentPhoneNumber;
    data["pdfLink"] = pdfLink;
    data['Shift'] = shift;
    data['status'] = status;
    data['OtherProp'] = otherProp ?? '';
    data['HomeNumber'] = homeNumber;
    data["authority"] = authority;
    data["OtherProp"] = otherProp;
    data["Guarantee"] = guarantee;
    if (nurseImages != null) {
      data["NurseImages"] = nurseImages?.toJson();
    }
    if (nurseFamily != null) {
      data["NurseFamily"] = nurseFamily?.map((e) => e.toJson()).toList();
    }
    data["NurseCategory"] = nurseCategory;
    if (reserveNurses != null) {
      data["ReserveNurses"] = reserveNurses;
    }
    data["Id"] = id;
    data["CreatedAt"] = createdAt;
    data["UpdatedAt"] = updatedAt;
    return data;
  }
}

class NurseFamily {
  String? nurseId;
  String? name;
  String? information;
  String? knowTime;
  String? phoneNumber;
  String? id;
  String? createdAt;
  String? updatedAt;

  NurseFamily(
      {this.nurseId,
      this.name,
      this.information,
      this.knowTime,
      this.phoneNumber,
      this.id,
      this.createdAt,
      this.updatedAt});

  NurseFamily.fromJson(Map<String, dynamic> json) {
    nurseId = json["NurseId"];
    name = json["Name"];
    information = json["Information"];
    knowTime = json["KnowTime"];
    phoneNumber = json["PhoneNumber"];
    id = json["Id"];
    createdAt = json["CreatedAt"];
    updatedAt = json["UpdatedAt"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["NurseId"] = nurseId;
    data["Name"] = name;
    data["Information"] = information;
    data["KnowTime"] = knowTime;
    data["PhoneNumber"] = phoneNumber;
    data["Id"] = id;
    data["CreatedAt"] = createdAt;
    data["UpdatedAt"] = updatedAt;
    return data;
  }
}

class NurseImages {
  String? nurseId;
  String? picture;
  String? firstPageImage;
  String? descriptionImage;
  dynamic agreementImage;
  String? id;
  String? createdAt;
  String? updatedAt;

  NurseImages(
      {this.nurseId,
      this.picture,
      this.firstPageImage,
      this.descriptionImage,
      this.agreementImage,
      this.id,
      this.createdAt,
      this.updatedAt});

  NurseImages.fromJson(Map<String, dynamic> json) {
    nurseId = json["NurseId"];
    picture = json["Picture"];
    firstPageImage = json["FirstPageImage"];
    descriptionImage = json["DescriptionImage"];
    agreementImage = json["AgreementImage"];
    id = json["Id"];
    createdAt = json["CreatedAt"];
    updatedAt = json["UpdatedAt"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["NurseId"] = nurseId;
    data["Picture"] = picture;
    data["FirstPageImage"] = firstPageImage;
    data["DescriptionImage"] = descriptionImage;
    data["AgreementImage"] = agreementImage;
    data["Id"] = id;
    data["CreatedAt"] = createdAt;
    data["UpdatedAt"] = updatedAt;
    return data;
  }
}