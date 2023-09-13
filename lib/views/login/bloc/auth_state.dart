part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class OtpSent extends AuthState {
  const OtpSent({required this.phoneNumber, required this.verificationId});

  final String phoneNumber;
  final String verificationId;

  @override
  List<Object?> get props => [phoneNumber, verificationId];
}

class OtpVerified extends AuthState {
  @override
  List<Object?> get props => [];
}

class Loading extends AuthState {
  const Loading();

  @override
  List<Object?> get props => [];
}

class Error extends AuthState {
  const Error({required this.error});

  final String error;

  @override
  List<Object?> get props => [];
}
