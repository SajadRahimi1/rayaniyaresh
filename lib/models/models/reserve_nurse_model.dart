import 'package:rayaniyaresh/models/models/nurse_model.dart';

class ReserveNurseModel {
  NurseModel? nurse;
  String? days;
  String? id;

  ReserveNurseModel(
      {this.nurse,
      this.days,
      this.id});

  ReserveNurseModel.fromJson(Map<String, dynamic> json) {
    nurse = json["Nurse"] == null ? null : NurseModel.fromJson(json["Nurse"]);
    days = json["Days"];
    id = json["Id"];
  }
}