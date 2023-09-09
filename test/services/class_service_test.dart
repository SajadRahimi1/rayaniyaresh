import 'package:flutter_test/flutter_test.dart';
import 'package:rayaniyaresh/core/services/reserve_class/class_service.dart';

void main() {
  test('test class service', () async {
    final request = await getAllClasses();
    print(request.body);
    expect(request.statusCode, 200);
  });
}
