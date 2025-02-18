import 'package:dartz/dartz.dart';
import 'package:online_shop_mvvm/scr/features/auth/data/models/user_model.dart';

import '../../../../core/errors/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> register(
      {required String name,
      required String email,
      required String password,
      required String phone});

  Future<Either<Failure, UserModel>> login(
      {required String email, required String password});

  Future<Either<Failure, Unit>> logout({required String fcmToken});

  Future<Either<Failure, Unit>> verifyEmail({required String email});

  Future<Either<Failure, Unit>> verifyOtp(
      {required String otp, required String email});

  Future<Either<Failure, Unit>> resetPassword({required String email});

  Future<Either<Failure, Unit>> changePassword({
    required String oldPassword,
    required String newPassword,
    required String token,
  });
}
