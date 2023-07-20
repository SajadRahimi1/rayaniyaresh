// ignore_for_file: constant_identifier_names

class RequestNurseModel {
  RequestNurseModel(
      {this.gender,
      this.age,
      this.shift,
      this.hourse,
      this.peopleInHuse,
      this.address,
      this.description,
      this.cctv});
  Gender? gender;
  String? age;
  Shift? shift;
  String? hourse;
  String? peopleInHuse;
  String? address;
  bool? cctv;
  String? description;
  NurseCategory? nurseCategory;
}

enum Gender { Male, Female, Both }
enum Shift { Boarding, Night, Hour }
enum NurseCategory { Kid, Oldage, Patient, All }
