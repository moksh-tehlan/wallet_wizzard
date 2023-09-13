part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class InitialEvent extends AuthEvent {
  const InitialEvent();

  @override
  List<Object?> get props => [];
}

class SendOtp extends AuthEvent {
  const SendOtp({required this.phoneNumber});

  final String phoneNumber;

  @override
  List<Object?> get props => [phoneNumber];
}

class VerifyOtp extends AuthEvent {
  const VerifyOtp({required this.otp, required this.verificationId});

  final String otp;
  final String verificationId;

  @override
  List<Object?> get props => [otp, verificationId];
}

class ErrorEvent extends AuthEvent {
  const ErrorEvent({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
