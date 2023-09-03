import 'package:rayaniyaresh/models/models/request_nurse_model.dart';

extension GenderExtension on Gender? {
  String getValue() => toString().split('.').last;
}

extension ShiftExtension on Shift? {
  String getValue() => toString().split('.').last;
  String getString() {
    switch (this) {
      case Shift.Boarding:
        return "شبانه روزی";
      case Shift.Night:
        return "شبانه";
      case Shift.Hour:
        return "مقطعی";
      default:
        return "";
    }
  }
}

extension CategoryExtension on NurseCategory? {
  String getValue() => toString().split('.').last;

  String titleFromEnum() {
    switch (this) {
      case NurseCategory.Kid:
        return "پرستار کودک";
      case NurseCategory.Oldage:
        return "پرستار سالمند";
      default:
    }
    return "پرستار بیمار";
  }

  String imageFromEnum() {
    switch (this) {
      case NurseCategory.Kid:
        return "baby-sitter.jpg";
      case NurseCategory.Oldage:
        return "oldage.jpg";
      default:
    }
    return "patient.jpg";
  }
}

