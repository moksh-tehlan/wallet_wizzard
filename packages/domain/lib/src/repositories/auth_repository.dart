import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';

/// An abstract repository for handling user authentication operations.
abstract class AuthRepository {

  /// Sends an OTP (One-Time Password) to the specified phone number.
  ///
  /// Parameters:
  /// - `phoneNumber`: The phone number to which the OTP will be sent.
  ///
  /// Returns a [Future] of [Either] that can contain either an [Failure]
  /// in case of an error or a [String] representing the verification ID.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final result = await authRepository.sendOtp('+1234567890');
  /// result.fold(
  ///   (failure) {
  ///     // Handle error
  ///   },
  ///   (verificationId) {
  ///     // OTP sent successfully, use verificationId for verification
  ///   },
  /// );
  /// ```
  Future<Either<Failure, String>> sendOtp(
    String phoneNumber,
  );

  /// Verifies an OTP (One-Time Password) using the provided OTP and verification ID.
  ///
  /// Parameters:
  /// - `otp`: The OTP entered by the user for verification.
  /// - `verificationId`: The verification ID received after sending the OTP.
  ///
  /// Returns a [Future] of [Either] that can contain either a [Failure]
  /// in case of an error or a [bool] indicating whether the OTP verification
  /// was successful.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final result = await authRepository.verifyOtp('123456', 'verificationId123');
  /// result.fold(
  ///   (failure) {
  ///     // Handle error
  ///   },
  ///   (isVerified) {
  ///     if (isVerified) {
  ///       // OTP verification successful
  ///     } else {
  ///       // OTP verification failed
  ///     }
  ///   },
  /// );
  /// ```
  Future<Either<Failure, bool>> verifyOtp(
    String otp,
    String verificationId,
  );
}
