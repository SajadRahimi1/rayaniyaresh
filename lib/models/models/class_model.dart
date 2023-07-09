class ClassModel {
  String? title;
  List<ClassCategories>? classCategories;
  String? imageName;
  String? id;

  ClassModel({this.title, this.classCategories, this.imageName, this.id});

  ClassModel.fromJson(Map<String, dynamic> json) {
    title = json["Title"];
    classCategories = json["ClassCategories"] == null
        ? null
        : (json["ClassCategories"] as List)
            .map((e) => ClassCategories.fromJson(e))
            .toList();
    imageName = json["ImageName"];
    id = json["Id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["Title"] = title;
    if (classCategories != null) {
      _data["ClassCategories"] =
          classCategories?.map((e) => e.toJson()).toList();
    }
    _data["ImageName"] = imageName;
    _data["Id"] = id;
    return _data;
  }
}

class ClassCategories {
  String? classId;
  String? title;
  List<String>? hours;
  List<String>? days;
  String? totallHours;
  String? timeHolding;
  String? price;
  String? prePaid;
  int? installmentNumber;
  String? installmentPrice;
  List<dynamic>? usersReserved;
  String? id;

  ClassCategories(
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
      this.usersReserved,
      this.id});

  ClassCategories.fromJson(Map<String, dynamic> json) {
    classId = json["ClassId"];
    title = json["Title"];
    hours = json["Hours"] == null || json["Hours"] == ""
        ? []
        : json["Hours"].toString().split(',');
    days = json["Days"] == null || json["Days"] == ""
        ? []
        : json["Days"].toString().split(',');
    totallHours = json["TotallHours"];
    timeHolding = json["TimeHolding"];
    price = json["Price"];
    prePaid = json["PrePaid"];
    installmentNumber = json["InstallmentNumber"];
    installmentPrice = json["InstallmentPrice"];
    usersReserved = json["UsersReserved"] ?? [];
    id = json["Id"];
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
    if (usersReserved != null) {
      _data["UsersReserved"] = usersReserved;
    }
    _data["Id"] = id;
    return _data;
  }
}
