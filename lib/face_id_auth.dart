import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class FaceIdAuth {
  static final LocalAuthentication auth = LocalAuthentication();

  static Future<bool> canAuthenticate() async {
    try {
      if (await auth.canCheckBiometrics || await auth.isDeviceSupported()) {
        final List<BiometricType> availableBiometrics =
            await auth.getAvailableBiometrics();

        Get.log('List of Available Biometrics $availableBiometrics');

        return (availableBiometrics.isNotEmpty &&
                availableBiometrics.contains(BiometricType.face))
            ? true
            : false;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  static Future<bool> authenticate() async {
    try {
      return await auth.authenticate(
        localizedReason: 'User Face Id to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
