import 'package:equatable/equatable.dart';

/// An abstract base class for representing failures.
abstract class Failure extends Equatable {
  /// Constructs a Failure instance.
  ///
  /// [message] is a required error message describing the failure.
  /// [exception] is an optional string describing the exception.
  /// [code] is an optional error code.
  const Failure({
    required this.message,
    this.exception,
    this.code,
  });

  final String message;
  final String? exception;
  final int? code;

  @override
  List<Object?> get props => <Object?>[message, exception, code];
}

/// Represents a failure related to Firebase services.
class FirebaseFailure extends Failure with EquatableMixin {
  /// Constructs a FirebaseFailure instance.
  ///
  /// [message] is the error message.
  /// [exception] is an optional exception message.
  /// [code] is an optional error code.
  const FirebaseFailure({
    required super.message,
    super.exception,
    super.code,
  });
}

/// Represents a failure related to device-specific issues.
class DeviceFailure extends Failure with EquatableMixin {
  /// Constructs a DeviceFailure instance.
  ///
  /// [message] is the error message.
  /// [exception] is an optional exception message.
  /// [code] is an optional error code.
  const DeviceFailure({
    required super.message,
    super.exception,
    super.code,
  });
}

/// Represents a generic failure.
class GenericFailure extends Failure with EquatableMixin {
  /// Constructs a GenericFailure instance.
  ///
  /// [message] is the error message.
  /// [exception] is an optional exception message.
  /// [code] is an optional error code.
  const GenericFailure({
    required super.message,
    super.exception,
    super.code,
  });
}
