import 'package:rayaniyaresh/core/services/message_service.dart';
import 'package:rayaniyaresh/models/models/request_nurse_model.dart';

bool babySitterValidation(RequestNurseModel model) {
  if (model.gender == null) {
    errorMessage("لطفا جنسیت را وارد کنید");
    return false;
  }
  if (model.age?.isEmpty ?? true) {
    errorMessage("لطفا سن را وارد کنید");
    return false;
  }

  if (model.shift == null) {
    errorMessage("لطفا شیفت کاری را وارد کنید");
    return false;
  }
  if (model.hours?.isEmpty ?? true) {
    errorMessage("لطفا ساعت کاری را مشخص کنید");
    return false;
  }
  if (model.cctv == null) {
    errorMessage("لطفا وضعیت دوربین مداربسته را تعیین کنید");
    return false;
  }
  if (model.address?.isEmpty ?? true) {
    errorMessage("لطفا آدرس  را وارد کنید");
    return false;
  }
  if (model.description?.isEmpty ?? true) {
    errorMessage("لطفا توضیحات را وارد کنید");
    return false;
  }

  return true;
}

void errorMessage(String message) =>
    showMessage(message: message, title: "خطا", type: MessageType.error);
