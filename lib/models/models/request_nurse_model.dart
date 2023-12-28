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
      this.problems,
      this.ages,
      this.cctv});
  Gender? gender;
  String? age;
  List<int?>? ages;
  Shift? shift;
  String? hours;
  String? from;
  String? to;
  String? province;
  String? city;
  String? neighborhood;
  String? peopleInHouse;
  String? address;
  bool? cctv;
  String? description;
  String? phoneNumber;
  List<int>? problems;
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
    ages = json['ages'];
    address = json['Address'];
    createdAt =
        json['CreatedAt'] == null ? null : DateTime.parse(json['CreatedAt']);
  }
}

enum Gender { Male, Female, Both }

enum Shift { Boarding, Day, Night, Hour }

enum NurseCategory { Kid, Oldage, Patient, All }
