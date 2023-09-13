import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(AuthInitial()) {
    on<InitialEvent>(_onInitialEvent);
    on<SendOtp>(_onSendOtp);
    on<VerifyOtp>(_onVerifyOtp);
    on<ErrorEvent>(_onError);
  }

  final AuthRepository _authRepository;

  Future<void> _onSendOtp(SendOtp event, Emitter<AuthState> emit) async {
    emit(const Loading());
    final response = await _authRepository.sendOtp(event.phoneNumber);
    emit(
      response.fold(
        (failure) => Error(error: failure.message),
        (verificationId) => OtpSent(
          phoneNumber: event.phoneNumber,
          verificationId: verificationId,
        ),
      ),
    );
  }

  Future<void> _onVerifyOtp(VerifyOtp event, Emitter<AuthState> emit) async {
    emit(const Loading());
    final response = await _authRepository.verifyOtp(
      event.otp,
      event.verificationId,
    );
    emit(
      response.fold(
        (failure) => Error(error: failure.message),
        (isVerified) => OtpVerified(),
      ),
    );
  }

  FutureOr<void> _onError(ErrorEvent event, Emitter<AuthState> emit) {
    emit(Error(error: event.message));
  }

  FutureOr<void> _onInitialEvent(InitialEvent event, Emitter<AuthState> emit) {
    emit(AuthInitial());
  }
}
