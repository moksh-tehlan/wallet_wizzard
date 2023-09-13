/// Custom exception class for handling Firebase Exceptions.
///
/// Example of how to use [FireException]:
///
/// ```dart
/// try {
///   // Code that may throw a FireException
///   throw FireException(message: 'Custom error message', code: 42);
/// } catch (e) {
///   if (e is FireException) {
///     print('Caught a FireException: ${e.message}');
///     print('Exception details: ${e.exception}');
///     print('Error code: ${e.code}');
///   } else {
///     // Handle other exceptions
///   }
/// }
/// ```
class FireException implements Exception {
  /// Creates a [FireException] instance.
  ///
  /// The [message] parameter is used to set the error message.
  /// The [exception] parameter provides additional details about the exception.
  /// The [code] parameter is an error code for classifying the exception.
  const FireException({
    this.message = 'Something unexpected happened!',
    this.exception = '',
    this.code = -1,
  });

  /// A custom error message describing the exception.
  /// The default value is 'Something unexpected happened!'.
  final String message;

  /// An optional description or details about the exception.
  final String exception;

  /// An optional error code associated with the exception.
  /// The default value is -1.
  final int code;
}

/// Custom exception class for handling device-related errors.
///
/// Example of how to use [DeviceException]:
///
/// ```dart
/// try {
///   // Code that may throw a DeviceException
///   throw DeviceException();
/// } catch (e) {
///   if (e is DeviceException) {
///     print('Caught a DeviceException: ${e.message}');
///     print('Exception details: ${e.exception}');
///     print('Error code: ${e.code}');
///   } else {
///     // Handle other exceptions
///   }
/// }
/// ```
class DeviceException implements Exception {
  /// Creates a [DeviceException] instance.
  ///
  /// The [message] parameter is used to set the error message.
  /// The [exception] parameter provides additional details about the exception.
  /// The [code] parameter is an error code for classifying the exception.
  const DeviceException({
    this.message = 'Check your internet connection',
    this.exception = '',
    this.code = -1,
  });

  /// A custom error message indicating the device or network issue.
  /// The default value is 'Check your internet connection'.
  final String message;

  /// An optional description or details about the exception.
  final String exception;

  /// An optional error code associated with the exception.
  /// The default value is -1.
  final int code;
}

/// Custom exception class for handling generic errors.
///
/// Example of how to use [GenericException]:
///
/// ```dart
/// try {
///   // Code that may throw a GenericException
///   throw GenericException(message: 'Custom error message', code: 42);
/// } catch (e) {
///   if (e is GenericException) {
///     print('Caught a GenericException: ${e.message}');
///     print('Exception details: ${e.exception}');
///     print('Error code: ${e.code}');
///   } else {
///     // Handle other exceptions
///   }
/// }
/// ```
class GenericException implements Exception {

  /// Creates a [GenericException] instance.
  ///
  /// The [message] parameter is used to set the error message.
  /// The [exception] parameter provides additional details about the exception.
  /// The [code] parameter is an error code for classifying the exception.
  const GenericException({
    this.message = 'Something went wrong',
    this.exception = '',
    this.code = -1,
  });

  /// A custom error message describing the exception.
  /// The default value is 'Something went wrong'.
  final String message;

  /// An optional description or details about the exception.
  final String exception;

  /// An optional error code associated with the exception.
  /// The default value is -1.
  final int code;
}

