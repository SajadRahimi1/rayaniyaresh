import 'package:rayaniyaresh/models/models/user_model.dart';

class SingletonClass {
  static final SingletonClass _instance = SingletonClass._internal();

  String? imageUrl = '';
  String? name = '';
  String? phoneNumber = '';

  factory SingletonClass() {
    return _instance;
  }

  SingletonClass._internal();

  // String get imageUrl {
  //   return _imageUrl;
  // }

  // void set imageUrl(String url) {
  //   _imageUrl = url;
  // }
}
