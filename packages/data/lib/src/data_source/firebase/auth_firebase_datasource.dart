import 'dart:async';

import 'package:domain/domain.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebaseDataSource {
  const AuthFirebaseDataSource({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;
  final FirebaseAuth _firebaseAuth;

  Future<String> sendOtp(String phoneNumber) async {
    try {
      final verificationIdCompleter = Completer<String>();
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          verificationIdCompleter.completeError(
            FirebaseAuthException(code: e.code),
          );
        },
        codeSent: (String verificationId, int? resendToken) {
          verificationIdCompleter.complete(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      final verificationId = await verificationIdCompleter.future;
      return verificationId;
    } on Exception catch (e) {
      throw FireException(
        message: 'Invalid mobile number',
        exception: e.toString(),
        code: e.hashCode,
      );
    }
  }

  Future<bool> verifyOtp(String verificationId, String otp) async {
    try {
      final credentials = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );
      await _firebaseAuth.signInWithCredential(credentials);
      return true;
    } on Exception catch (e) {
      throw FireException(
        message: 'Invalid OTP',
        exception: e.toString(),
        code: e.hashCode,
      );
    }
  }
}
