import 'package:dartz/dartz.dart';
import 'package:data/src/data_source/firebase/auth_firebase_datasource.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:domain/domain.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(
      {required AuthFirebaseDataSource authFirebaseDataSource,
      required DataConnectionChecker dataConnectionChecker})
      : _authFirebaseDataSource = authFirebaseDataSource,
        _dataConnectionChecker = dataConnectionChecker;
  final AuthFirebaseDataSource _authFirebaseDataSource;
  final DataConnectionChecker _dataConnectionChecker;

  @override
  Future<Either<Failure, String>> sendOtp(String phoneNumber) async {
    try {
      if (await _dataConnectionChecker.hasConnection) {
        final verificationId =
            await _authFirebaseDataSource.sendOtp(phoneNumber);
        return Right<Failure, String>(verificationId);
      } else {
        throw const DeviceException(
          message: 'Device is offline',
        );
      }
    } on FireException catch (e) {
      return Left<Failure, String>(
        FirebaseFailure(
          message: e.message,
          exception: e.exception,
          code: e.code,
        ),
      );
    } on DeviceException catch (e) {
      return Left<Failure, String>(
        FirebaseFailure(
          message: e.message,
          exception: e.exception,
          code: e.code,
        ),
      );
    } catch (e) {
      return Left<Failure, String>(
        GenericFailure(
          message: 'Something went wrong',
          exception: e.toString(),
          code: e.hashCode,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> verifyOtp(
    String otp,
    String verificationId,
  ) async {
    try {
      if (await _dataConnectionChecker.hasConnection) {
        final result =
            await _authFirebaseDataSource.verifyOtp(verificationId, otp);
        return Right<Failure, bool>(result);
      } else {
        throw const DeviceException(
          message: 'Device is offline',
        );
      }
    } on FireException catch (e) {
      return Left<Failure, bool>(
        FirebaseFailure(
          message: e.message,
          exception: e.exception,
          code: e.code,
        ),
      );
    } on DeviceException catch (e) {
      return Left<Failure, bool>(
        FirebaseFailure(
          message: e.message,
          exception: e.exception,
          code: e.code,
        ),
      );
    } catch (e) {
      return Left<Failure, bool>(
        GenericFailure(
          message: 'Something went wrong',
          exception: e.toString(),
          code: e.hashCode,
        ),
      );
    }
  }
}
