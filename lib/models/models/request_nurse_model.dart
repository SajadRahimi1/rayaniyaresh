// ignore_for_file: constant_identifier_names

class RequestNurseModel {
  RequestNurseModel(
      {this.gender,
      this.age,
      this.shift,
      this.hours,
      this.peopleInHouse,
      this.address,
      this.problem,
      this.description,
      this.cctv});
  Gender? gender;
  String? age;
  Shift? shift;
  String? hours;
  String? peopleInHouse;
  String? address;
  bool? cctv;
  String? description;
  String? phoneNumber;
  String? name;
  String? problem;
  DateTime? createdAt;
  NurseCategory? nurseCategory;

  RequestNurseModel.fromJson(Map json) {
    nurseCategory = json['NurseCategory'] == null
        ? null
        : NurseCategory.values[json['NurseCategory']];
    description = json['description'];
    gender = json['Gender'] == null ? null : Gender.values[json['Gender']];
    age = json['Age'];
    shift = json['Shift'] == null ? null : Shift.values[json['Shift']];
    hours = json['Hours'];
    peopleInHouse = json['PeopleInHouse'];
    cctv = json['CCTV'];
    address = json['Address'];
    createdAt =
        json['CreatedAt'] == null ? null : DateTime.parse(json['CreatedAt']);
  }
}

enum Gender { Male, Female, Both }
enum Shift { Boarding, Night, Hour }
enum NurseCategory { Kid, Oldage, Patient, All }
