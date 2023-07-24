class NurseGuaranteeModel {
  String? husbandPhoneNumber;
  String? childPhoneNumber;
  String? parentPhoneNumber;
  String? nurseId;
  Guarantee? guarantee;
  List<NurseParentModel>? nurseParentModels;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['husbandPhoneNumber'] = husbandPhoneNumber;
    data['childPhoneNumber'] = childPhoneNumber;
    data['parentPhoneNumber'] = parentPhoneNumber;
    data['nurseId'] = nurseId;
    data['guarantee'] = guarantee.toString().split('.').last;

    data['nurseFamily'] = nurseParentModels?.map((e) => e.toJson()).toList();
    return data;
  }
}

enum Guarantee { promissory, check, businessLicense, representative }

class NurseParentModel {
  String? name;
  String? information;
  String? knowingTime;
  String? phoneNumber;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['information'] = information;
    data['knowTime'] = knowingTime;
    data['PhoneNumber'] = phoneNumber;
    return data;
  }
}
