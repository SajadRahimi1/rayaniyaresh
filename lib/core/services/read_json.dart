import 'package:flutter/services.dart' show rootBundle;

Future<String> loadJsonFromAsset(String path) async {
  return await rootBundle.loadString(path);
}