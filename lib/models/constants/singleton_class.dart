class SingletonClass {
  static final SingletonClass _instance = SingletonClass._internal();

  String imageUrl = '';

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