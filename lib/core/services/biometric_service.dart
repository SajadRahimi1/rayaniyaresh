import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';

class BiometricService {
  bool canAuthenticateWithBiometrics = false;
  bool canAuthenticate = false;
  final LocalAuthentication auth = LocalAuthentication();
  List<BiometricType> availableBiometrics = [];

  Future<void> fillVariable() async {
    canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    availableBiometrics = await auth.getAvailableBiometrics();

    if (availableBiometrics.contains(BiometricType.strong)) {
      canAuthenticate = true;
    }
  }

  Future<bool> authenticate() async {
    try {
      if (canAuthenticateWithBiometrics && canAuthenticate) {
        return await auth.authenticate(
            localizedReason: 'برای ورود اثرانگشت خود را تایید کنید',
            authMessages: const <AuthMessages>[
              AndroidAuthMessages(signInTitle: 'آسیاسلامت', biometricHint: "",),
            ]);
      }
    } catch (_) {
      return false;
    }
    return false;
  }
}
